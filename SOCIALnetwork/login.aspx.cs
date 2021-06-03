using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOCIALnetwork
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //user login
        protected void loginpack_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State==ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master where username='" + uname.Text.Trim() + "' AND password='" + password.Text.Trim() +"'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                       
                        Session["uname"]=dr.GetString(0);
                        Session["name"]=dr.GetString(1);
                        Session["art"] = dr.GetString(4);

                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Label2.Text = "Wrong Username or Password";
                }
            }
            catch (Exception EX)
            {

                
            }
            
        }
    }
}