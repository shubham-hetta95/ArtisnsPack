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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            profileusername.Text = Session["logUser"].ToString();
           
            GridView2.Visible = false;
            GridView3.Visible = false;
           
            
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            
            SqlCommand cmd = new SqlCommand("select * from member_master where username=@user", con);
            cmd.Parameters.AddWithValue("@user", profileusername.Text);
           
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (dr.GetSqlBinary(5).IsNull && dr.IsDBNull(dr.GetOrdinal("bio")))
                    {
                        Image1.ImageUrl = "img/logo12.png";
                        profilename.Text = dr.GetValue(1).ToString();
                        profileart.Text = dr.GetValue(4).ToString();
                        Label4.Text = "";
                    }
                    else if (dr.GetSqlBinary(5).IsNull && !dr.IsDBNull(dr.GetOrdinal("bio")))
                    {
                        Image1.ImageUrl = "img/logo12.png";
                        Label4.Text = dr.GetString(8);
                        profilename.Text = dr.GetValue(1).ToString();
                        profileart.Text = dr.GetValue(4).ToString();
                    }
                    else if (!dr.GetSqlBinary(5).IsNull && dr.IsDBNull(dr.GetOrdinal("bio")))
                    {

                        byte[] imagedata = (byte[])dr["profile_pic"];
                        string img = Convert.ToBase64String(imagedata, 0, imagedata.Length);

                        Image1.ImageUrl = "data:image/png;base64," + img;
                        profilename.Text = dr.GetValue(1).ToString();
                        profileart.Text = dr.GetValue(4).ToString();
                        Label4.Text = "";

                    }

                    else
                    {
                        byte[] imagedata = (byte[])dr["profile_pic"];
                        string img = Convert.ToBase64String(imagedata, 0, imagedata.Length);

                        Image1.ImageUrl = "data:image/png;base64," + img;
                        Label4.Text = dr.GetString(8);
                        profilename.Text = dr.GetValue(1).ToString();
                        profileart.Text = dr.GetValue(4).ToString();
                    }


                    
                }
                
            }
            
            dr.Close();
         
            SqlCommand cd = new SqlCommand("select * from follow where following_id='" + Session["logUser"] + "' AND follow_id='" + Session["uname"]+"'", con);

             SqlDataReader reader;
            reader = cd.ExecuteReader();
            if (reader.Read())
            {
               
                Button1.Text = "Following";
                Button1.Enabled = false;

            }
            else
            {
                Button1.Text = "Follow";
              
                }


            con.Close();
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
                //SqlConnection con = new SqlConnection(strcon);
                //con.Open();

                //int index;

                //index = Convert.ToInt32(e.CommandArgument.ToString());
               // GridViewRow row = GridView1.Rows[index];

                //TextBox Com = (TextBox)row.FindControl("TextBox1");
                //Button go = (Button)row.FindControl("Button7");
                //TextBox lab = (TextBox)row.FindControl("TextBox4");
               // Com.Visible = true;
                //go.Visible = true;
                //go.Text = "go";
                //lab.Visible = true;
                //SqlCommand command = new SqlCommand("select comment from post where id= @ids ", con);
                //command.Parameters.AddWithValue("@ids", GridView1.Rows[index].Cells[0].Text);
                //SqlDataReader dr = command.ExecuteReader();
                //if (dr.Read())
                //{

                  //  lab.Text = dr.GetValue(0).ToString();

                //}


                //con.Close();
            }

            if (e.CommandName == "go")
            {
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
                   
                    Response.Redirect("profile1.aspx");
                    con.Close();
            }
        }

       

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "follow")
            {
                int l;
                l = int.Parse(e.CommandArgument.ToString());
                string name = GridView2.Rows[l].Cells[0].Text;
                Session["logUser"] = name;
                Response.Redirect("profile1.aspx");

            }
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "following")
            {
                int l;
                l = int.Parse(e.CommandArgument.ToString());
                string name = GridView3.Rows[l].Cells[0].Text;
                Session["logUser"] = name;
                Response.Redirect("profile1.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView3.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand command = new SqlCommand("insert into follow values('" + Session["uname"] + "','" + Session["logUser"] + "')", con);
            command.ExecuteNonQuery();
            Button1.Text = "Following";
            Response.Redirect("profile1.aspx");
            con.Close();
        }
    }
}