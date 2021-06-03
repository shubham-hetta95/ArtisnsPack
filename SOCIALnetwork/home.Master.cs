using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SOCIALnetwork
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["uname"] == null)
                {
                   
                    home.Visible = false;
                    explore.Visible = false;
                    message.Visible = false;
                    notification.Visible = false;
                    user.Visible = false;
                    login.Visible = true;
                    
                }
                else
                {
                    home.Visible = true;
                    explore.Visible = true;
                    message.Visible = true;
                    notification.Visible = true;
                    user.Visible = true;
                    login.Visible = false;
                    TextBox1.Visible = true;
                    Button1.Visible = true;

                    user.Text = Session["uname"].ToString();
                    

                }

            }
            catch (Exception ex)
            {

                
            }
        }

        protected void home_Click(object sender, EventArgs e)
        {

        }

        protected void art_Click(object sender, EventArgs e)
        {

        }

        protected void feed_Click(object sender, EventArgs e)
        {

        }

        protected void explore_Click(object sender, EventArgs e)
        {
            Response.Redirect("explore.aspx");
        }

        protected void user_Click(object sender, EventArgs e)
        {

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["uname"] = null;
            Session["name"] = null;
            Session["art"] = null;

            home.Visible = false;
            explore.Visible = false;
            message.Visible = false;
            notification.Visible = false;
            user.Visible = false;
            Response.Redirect("login.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void painting_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Painting";
            Response.Redirect("Art.aspx");
        }

        protected void sketching_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Sketching";
            Response.Redirect("Art.aspx");
        }

        protected void writing_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Writing";
            Response.Redirect("Art.aspx");
        }

        protected void photography_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Photography";
            Response.Redirect("Art.aspx");
        }

        protected void craft_Click(object sender, EventArgs e)
        {
            Session["explore"] = "Craft";
            Response.Redirect("Art.aspx");
        }
        protected void search_Click(object sender, EventArgs e)
        {



            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from post where username='" + TextBox1.Text + "'", con);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["logUser"] = TextBox1.Text;
                Response.Redirect("profile1.aspx");
              
            }
            else
            {
                //TextBox1.Text = "No Such User";
                Label1.Visible = true;
                Label1.Text = "No Such User";
            }
        }
    }
}