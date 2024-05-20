using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket_system
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = null;
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
            foreach( var login in db.Logins )
            {
                if(userTxtbx.Text == login.username && passtxtbx.Text == login.password)
                {
                    int Level = login.employeeType;
                    Session["ID"] = login.EmployeeID;
                    Session["employeetype"] = Level;
                    Session["username"] = login.username;

                    if(Level == 0)
                    {
                        Session["Login"] = true;
                        Response.Redirect("Home.aspx");
                    }
                    else if(Level == 1)
                    {
                        Session["Login"] = true ;
                        Response.Redirect("Home.aspx");
                    }
                    else if(Level == 2)
                    {
                        Session["Login"] = true;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Session["Login"] = null;
                        errorLbl.Text = "Account Level Error";
                    }

                }
                else
                {
                    errorLbl.Text = "Incorrect Login";
                }
            }
        }
    }
}