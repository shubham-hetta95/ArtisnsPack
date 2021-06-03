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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            string ch = "LIKE ";
            if (e.CommandName == "likecount")
            {
                
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                int l;
                l = int.Parse(e.CommandArgument.ToString());
                
                SqlCommand cmd = new SqlCommand("update post set likess+=1 where id = @id ", con);
                cmd.Parameters.AddWithValue("@id", GridView1.Rows[l].Cells[0].Text);
                cmd.ExecuteNonQuery();
                GridViewRow row = GridView1.Rows[l];
                Button lb = (Button)row.FindControl("Button3");
                

                SqlCommand cd = new SqlCommand("select likess from post where id= @ids ", con);
                cd.Parameters.AddWithValue("@ids", GridView1.Rows[l].Cells[0].Text);
                SqlDataReader dr = cd.ExecuteReader();
                if (dr.Read())
                {

                    ch += dr.GetValue(0).ToString();
                    lb.Text = ch;
                }

                con.Close();
            }

            if (e.CommandName == "comment")
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                int index;

                index = Convert.ToInt32(e.CommandArgument.ToString());
                GridViewRow row = GridView1.Rows[index];

                TextBox Com = (TextBox)row.FindControl("TextBox1");
                Button go = (Button)row.FindControl("Button7");
                TextBox lab = (TextBox)row.FindControl("TextBox4");
                Com.Visible = true;
                go.Visible = true;
                //go.Text = "go";
                lab.Visible = true;
                SqlCommand command = new SqlCommand("select comment from post where id= @ids ", con);
                command.Parameters.AddWithValue("@ids", GridView1.Rows[index].Cells[0].Text);
                SqlDataReader dr = command.ExecuteReader();
                if (dr.Read())
                {

                    lab.Text = dr.GetValue(0).ToString();

                }


                con.Close();
            }

            if (e.CommandName == "go")
            {
                    string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    int index;

                    index = Convert.ToInt32(e.CommandArgument.ToString());
                    GridViewRow row = GridView1.Rows[index];
                    TextBox Com = (TextBox)row.FindControl("TextBox1");
                    Button go = (Button)row.FindControl("Button7");

                    SqlCommand cmd = new SqlCommand("update post set comment=comment + '" + Session["uname"] + "'  +  ' : ' + '" + Com.Text + "'+ '  ' where id=  @ids", con);
                    cmd.Parameters.AddWithValue("@ids", GridView1.Rows[index].Cells[0].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write(Com.Text);
                    Response.Redirect("explore.aspx");
            }

            if (e.CommandName == "user")
            {
                int l;
                l = int.Parse(e.CommandArgument.ToString());
                GridViewRow row = GridView1.Rows[l];
                LinkButton b = (LinkButton)row.FindControl("LinkButton1");
                string name = b.Text;
                Session["logUser"] = name;
                Response.Redirect("profile1.aspx");
            }
        }

    }
}