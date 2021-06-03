using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOCIALnetwork
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Sketching";
            Response.Redirect("Art.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Photography";
            Response.Redirect("Art.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Craft";
            Response.Redirect("Art.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Writing";
            Response.Redirect("Art.aspx");
        }
    }
}