using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Ticket_system
{
    public partial class createTicket : System.Web.UI.Page
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
            }
            else if (type == 1)
            {
                employeeLbl.Text = "IT Technician";
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
        }

        
        //Btn Functionality.
        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        // send ticket functionality
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
            var dbticket = db.Tickets;
            if (messagetxt.Text.Length <= 12 && subtxt.Text.Length <= 12)
            {
                errorLbl.Text = "Error, Please input 12 characters in both Subject & Message";
            }
            else
            {
                string id;
                string sub;
                string msg;

                errorLbl.Text = "";
                Ticket ticket = new Ticket();
                {
                     id = IdLbl.Text;
                     sub = subtxt.Text;
                     msg = messagetxt.Text;
                };

                ticket.employeeID = Convert.ToInt32(id);
                ticket.message  = msg;
                ticket.subject = sub;
                ticket.Completed = Convert.ToBoolean(false);

                db.Tickets.Add(ticket);
                db.SaveChanges();
                Response.Redirect("sucess.aspx");
            }
        }
    }
}