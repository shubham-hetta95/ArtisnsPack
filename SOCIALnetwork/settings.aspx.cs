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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from member_master where username=@user", con);
            cmd.Parameters.AddWithValue("@user", Session["uname"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())

                {
                    if (dr.IsDBNull(dr.GetOrdinal("bio")))
                    {
                        TextBox1.Text = dr.GetString(0);
                        TextBox3.Text = dr.GetString(1);
                    }
                    else
                    {
                        TextBox1.Text = dr.GetString(0);
                        TextBox3.Text = dr.GetString(1);
                        TextBox4.Text = dr.GetString(8);
                    }                  
                   
                }

            }

        }

        protected void changepassword_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from member_master where username='" + Session["uname"] + "' AND password='" + password.Text + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {


                SqlCommand cd = new SqlCommand("update member_master set password = @pass where username = '" + Session["uname"] + "' ", con);
                cd.Parameters.AddWithValue("@pass", TextBox2.Text);
                dr.Close();
                cd.ExecuteNonQuery();
                Label2.Text = "Password Changed successfully";   
                      
                
            }
            else
            {
                Label2.Text="Incorrect Old password!";
            }
            con.Close();

        }


        protected void editprofile_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cd = new SqlCommand("update member_master set name=@name1,bio=@bio where username = '" + Session["uname"] + "' ", con);
                //cd.Parameters.AddWithValue("@uname", TextBox1.Text);
                cd.Parameters.AddWithValue("@name1", TextBox3.Text.Trim());
                cd.Parameters.AddWithValue("@bio", TextBox4.Text.Trim());
                cd.ExecuteNonQuery();
                Label3.Text = "Profile Updated successfully";
                con.Close();
            }
            
            
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }
    }
}