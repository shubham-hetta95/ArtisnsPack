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
    public partial class forget : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void changepassword_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from member_master where username='" + uname.Text.Trim() + "' and ans='" + ans.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                SqlCommand cd = new SqlCommand("update member_master set password = @pass where username = '" + uname.Text.Trim() + "' ", con);
                cd.Parameters.AddWithValue("@pass", TextBox2.Text);
                dr.Close();
                cd.ExecuteNonQuery();
                Label1.Text = "Password Changed successfully";

            }
            else
            {
                Response.Write("Incorrect password!");
            }
        }
    }
}