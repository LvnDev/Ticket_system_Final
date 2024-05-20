using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ticket_system
{
    public partial class sucess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}