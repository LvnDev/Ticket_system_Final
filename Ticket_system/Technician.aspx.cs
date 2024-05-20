using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Ticket_system
{
    public partial class Technician : System.Web.UI.Page
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
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();

            ticketGridview.DataSource = db.Tickets.Where(ticket => ticket.Completed == false).ToList(); //find uncompleted tickets
            ticketGridview.DataBind(); //save the data onto the grid.
        }
        //btns
        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void ticketGridview_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
                if (ticketGridview.SelectedRow != null)
                {
                    int ID = Convert.ToInt32(ticketGridview.SelectedRow.Cells[1].Text);
                    string subject = Convert.ToString(ticketGridview.SelectedRow.Cells[2].Text);

                    subTxtbox.Text = subject;

                    var selectedTicket = db.Tickets.FirstOrDefault(ticket => ticket.TicketID == ID);
                    if (selectedTicket != null)
                    {
                        msgTxtbox.Text = Convert.ToString(selectedTicket.message);
                        foreach (var login in db.Logins)
                        {
                            if (selectedTicket.employeeID == login.EmployeeID)
                            {
                                empemailLbl.Text = login.email;
                                empnameLbl.Text = login.username;
                            }
                        }
                    }
                    else
                    {
                        msgTxtbox.Text = "Ticket Not Found.";
                    }
                }
                else
                {
                    msgTxtbox.Text = "no row selected";
                    subTxtbox.Text = "no row selected.";
                }
            }
            catch (Exception ex)
            {
                msgTxtbox.Text = "Error! message: " + ex.Message;
            }
        }

        protected void completeBtn_Click(object sender, EventArgs e)
        {
            AutomotivationDatabaseEntities db = new AutomotivationDatabaseEntities();
            if (ticketGridview.SelectedRow != null)
            {
                var ticketId = Int32.Parse(ticketGridview.SelectedRow.Cells[1].Text);
                var ticket = db.Tickets.FirstOrDefault(t => t.TicketID == ticketId);
                if (ticketId != null)
                {
                    ticket.Completed = true;
                    db.SaveChanges();
                    Response.Redirect("Technician.aspx");
                }

            }
            else
            {
                msgTxtbox.Text = "no ticket selected";
            }
        }
    }
}