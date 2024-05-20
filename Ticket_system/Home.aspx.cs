using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket_system
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            messageTxt.Text = "Please select inbox.";
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

                manBtn.Enabled = false;
                manBtn.Visible = false;
                techBtn.Enabled = false;
                techBtn.Visible = false;
            }
            else if (type == 1)
            {
                employeeLbl.Text = "IT Technician";

                manBtn.Enabled = false;
                manBtn.Visible = false;
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

            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities(); //connect the database.
            inboxGrid.DataSource = db.Tickets.Where(ticket => ticket.employeeID == ID).ToList(); //look at ticket employee id and compare the logged in ID.
            inboxGrid.DataBind(); //save founded data onto the grid view.
            //i hate doing this part, I lost ton of time lost because of it didn't like having data source connected
            // which doesn't make sense. *facepalm*.
        }


        protected void inboxGrid_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
                if (inboxGrid.SelectedRow != null)
                {
                    int ID = Convert.ToInt32(inboxGrid.SelectedRow.Cells[1].Text);
                    string subject = Convert.ToString(inboxGrid.SelectedRow.Cells[2].Text);

                    subjectTxt.Text = subject;

                    var selectedTicket = db.Tickets.FirstOrDefault(ticket => ticket.TicketID == ID);
                    if (selectedTicket != null)
                    {
                        messageTxt.Text = Convert.ToString(selectedTicket.message);
                    }
                    else
                    {
                        messageTxt.Text = "Ticket Not Found.";
                    } 
                }
                else
                {
                    subjectTxt.Text = "no row selected";
                    messageTxt.Text = "no row selected.";
                }
            }
            catch (Exception ex)
            {
                messageTxt.Text = "Error! message: " + ex.Message;
            }
        }
        //button functionality
        protected void delBtn_Click(object sender, EventArgs e)
        {
            if (inboxGrid.SelectedRow != null)
            {
                //sql delete btn
                int tickID = Convert.ToInt32(inboxGrid.SelectedRow.Cells[1].Text);
                AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
                var selectedticket = db.Tickets.FirstOrDefault(t => t.TicketID == tickID);
                if (selectedticket != null)
                {
                    db.Tickets.Remove(selectedticket);
                    db.SaveChanges();
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                messageTxt.Text = "Please select a inbox to perform this action.";
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void createBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("createTicket.aspx");
        }

        protected void techBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Technician.aspx");
        }

        protected void manBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("manager.aspx");
        }

    }
}