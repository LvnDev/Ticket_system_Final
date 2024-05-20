using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Ticket_system
{
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            int ID = (int)Session["ID"];
            int type = (int)Session["employeetype"];

            IdLbl.Text = ID.ToString();
            if (type == 0)
            {
                employeeLbl.Text = "Employee";
                Response.Redirect("Default.aspx");
            }
            else if (type == 1)
            {
                employeeLbl.Text = "IT Technician";
                Response.Redirect("Default.aspx");
            }
            else if (type == 2)
            {
                employeeLbl.Text = "Manager";
            }
            else
            {
                employeeLbl.Text = "Unknown Type";
                Response.Redirect("Default.aspx");
            }

            /// this code below prevents whole data shown again once someone selects the grid data. ///////
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();

            string name = SnameTxt.Text;
            string email = SemailTxt.Text;
            string id = SidTxt.Text;

            if (string.IsNullOrEmpty(name) && string.IsNullOrEmpty(email) && string.IsNullOrEmpty(id))
            {
                accountGridview.DataSource = db.Logins.ToList();
                accountGridview.DataBind();
            }
            /////////////////////////////////
        }

        //search func
        protected void searchBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
            var query = db.Logins.AsQueryable(); //not needing to write db.logins.asqueryable all the time.

            string name = SnameTxt.Text;
            string email = SemailTxt.Text;
            string id = SidTxt.Text;

            if (string.IsNullOrEmpty(name) && string.IsNullOrEmpty(email) && string.IsNullOrEmpty(id)) //if user doesn't put anything in the txt box
            {
                accountGridview.DataSource = db.Logins.ToList(); // just shows the whole db into the table.
                accountGridview.DataBind();
            }
            else //if one of them are not null.
            {
                //check each text boxes as if one or more are inputted so the user can search.
                if (!string.IsNullOrEmpty(name))
                {
                    query = query.Where(log => log.username.Contains(name)); // ".Contains" is used to substitute one or more characters in strings.
                }
                if (!string.IsNullOrEmpty(email))
                {
                    query = query.Where(log => log.email.Contains(email));
                }
                if (!string.IsNullOrEmpty(id) && id != "0")
                {
                    int idValue;
                    if (int.TryParse(id, out idValue))
                    {
                        query = query.Where(log => log.EmployeeID == idValue);
                    }
                }

                // Execute the query and retrieve the results
                List<Login> execute = query.ToList();

                accountGridview.DataSource = execute; // read the executed result
                accountGridview.DataBind(); //save onto the data grid.
            }
        }

        // SQL modify func
        protected void modifyBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();

            string name = MnameTxt.Text;
            string pass = MpassTxt.Text;
            string email = MemailTxt.Text;
            string type = MtypeTxt.Text; // int

            if (accountGridview.SelectedRow == null)
            {
                errorLbl.Text = "Error: no record selected. please Select a record";
                return;
            }
            else if (string.IsNullOrEmpty(name) && string.IsNullOrEmpty(pass) && string.IsNullOrEmpty(email) && string.IsNullOrEmpty(type))
            {
                errorLbl.Text = "Error: Please Input data to make changes to the selected record.";
                return;
            }

            // Get the ID of the selected record
            TableCell IDcell = accountGridview.SelectedRow.Cells[1];
            int selectedID;
            if (!int.TryParse(IDcell.Text, out selectedID))
            {
                errorLbl.Text = "Error: Invalid ID.";
                return;
            }

            // Find the login record by ID
            var login = db.Logins.FirstOrDefault(l => l.EmployeeID == selectedID);
            if (login == null)
            {
                errorLbl.Text = "Error: Record not found.";
                return;
            }
            if (!string.IsNullOrEmpty(type))
            {
                int typeID;
                if (int.TryParse(type, out typeID))
                {
                    if (typeID < 0 || typeID > 2)
                    {
                        errorLbl.Text = "Error: Invalid Employee Type";
                        return;
                    }
                    else
                    {
                        login.employeeType = typeID;
                    }
                }
                else
                {
                    errorLbl.Text = "error: contact IT support";
                    return;
                }
            }
            // Update login properties
            if (!string.IsNullOrEmpty(name))
            {
                var existingUsername = db.Logins.FirstOrDefault(l => l.username == name && l.EmployeeID != selectedID);
                if (existingUsername != null)
                {
                    errorLbl.Text = "Error: Username already has been taken!";
                    return;
                }
                else
                {
                    login.username = name;
                }
            }
            if (!string.IsNullOrEmpty(pass))
            {
                if (pass.Length < 8)
                {
                    errorLbl.Text = "Error: Password must be minimum length of atleast 8 characters!";
                    return;
                }
                else
                {
                    login.password = pass;
                }
            }
            if (!string.IsNullOrEmpty(email))
            {
                login.email = email;
            }


            // Save changes to the database
            try
            {
                db.SaveChanges();
                Response.Redirect("manager.aspx");

            }
            catch (Exception ex)
            {
                errorLbl.Text = "Error: " + ex.Message;
            }
        }

        //SQL delete btn
        protected void delBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
            if (accountGridview.SelectedRow == null)
            {
                errorLbl.Text = "Please Select a Record in order to delete";
                return;
            }
            else
            {
                TableCell IDcell = accountGridview.SelectedRow.Cells[1]; //extract id from the cell
                int selectedID; // make int for ID
                foreach (var log in db.Logins)
                {
                    if (int.TryParse(IDcell.Text, out selectedID)) //convert the cell ID which will try to put into the selectedID int
                    {
                        int sessionID = Convert.ToInt32((int)Session["ID"]);
                        if (selectedID != sessionID)
                        {
                            var logdel = db.Logins.FirstOrDefault(l => l.EmployeeID == selectedID); //find the record with selected ID
                            db.Logins.Remove(logdel); //remove record
                            errorLbl.Text = "";
                        }
                        else
                        {
                            //make sure someone doesn't delete their own account to prevent a lot of errors!
                            errorLbl.Text = "Error, Cannot Delete your own account!!";
                            return;
                        }

                    }
                    else
                    {
                        errorLbl.Text = "Error: account not affiliated with unique ID";
                        return;
                    }
                }
                try
                {
                    db.SaveChanges();
                    accountGridview.DataSource = db.Logins.ToList(); //list all of logins
                    accountGridview.DataBind(); // save onto dataset.
                }
                catch (Exception ex)
                {
                    errorLbl.Text = ex.Message;
                }
            }
        }

        //SQL create btn
        protected void createBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();

            string name = MnameTxt.Text;
            string pass = MpassTxt.Text;
            string email = MemailTxt.Text;
            string type = MtypeTxt.Text; // int

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(pass) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(type))
            {
                errorLbl.Text = "Error: In order to create account, you must input all the following text boxes"; // must input all information in all text box
            }
            else
            {
                if (db.Logins.Any(l => l.username == name))
                {
                    errorLbl.Text = "Error: Username already exists!";
                    return;
                }
                Login log = new Login
                {
                    username = name,
                    password = pass,
                    email = email,
                };
                int typeconvert = Convert.ToInt32(type);
                if (typeconvert < 0 || typeconvert > 2)
                {
                    errorLbl.Text = ("Error: Invalid Employee Type");
                    return;
                    //make sure they're using the correct employee types.
                }
                else
                {
                    log.employeeType = typeconvert;
                }    
                if (pass.Length < 8)
                {
                    errorLbl.Text = "Error: Password must be minimum length of atleast 8 characters!";
                    return;
                    //this meet's the new Web Content Accessibility Guidelines (WCAG) 2.2 criteria
                }
                else
                {
                    log.password = pass;
                }

                log.username = name;
                try
                {
                    db.Logins.Add(log);
                    db.SaveChanges();

                    accountGridview.DataSource = db.Logins.ToList(); //list all of logins
                    accountGridview.DataBind(); // save onto dataset.
                }
                catch (Exception ex)
                {
                    errorLbl.Text = ex.Message;
                }
            }
        }

        //btn functions
        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
