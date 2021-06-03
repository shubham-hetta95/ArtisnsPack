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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            profileusername.Text = Session["uname"].ToString();
            profilename.Text = Session["name"].ToString();
            profileart.Text = Session["art"].ToString();

            GridView2.Visible = false;
            GridView3.Visible = false;
           
           
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
          
           SqlCommand cmd = new SqlCommand("select profile_pic, bio from member_master where username=@user", con);
            cmd.Parameters.AddWithValue("@user",profileusername.Text);            
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while (dr.Read())

                {

                    if (dr.GetSqlBinary(0).IsNull && dr.IsDBNull(dr.GetOrdinal("bio")))
                    {
                        Image1.ImageUrl = "img/logo12.png";
                        Label4.Text = "Add bio.";
                    }
                    else if (dr.GetSqlBinary(0).IsNull && !dr.IsDBNull(dr.GetOrdinal("bio")))
                    {
                        Image1.ImageUrl = "img/logo12.png";
                        Label4.Text = dr.GetString(1);
                    }
                    else if (!dr.GetSqlBinary(0).IsNull && dr.IsDBNull(dr.GetOrdinal("bio")))
                    {
                       
                        byte[] imagedata = (byte[])dr["profile_pic"];
                        string img = Convert.ToBase64String(imagedata, 0, imagedata.Length);

                        Image1.ImageUrl = "data:image/png;base64," + img;
                        Label4.Text = "Add Bio";
                    }


                    else
                    {
                        byte[] imagedata = (byte[])dr["profile_pic"];
                        string img = Convert.ToBase64String(imagedata, 0, imagedata.Length);

                        Image1.ImageUrl = "data:image/png;base64," + img;
                        Label4.Text = dr.GetString(1);
                    }
                }

            }
            
        }






        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            string ch = "LIKE  ";
            if (e.CommandName == "likecount")
            {
                
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                int l;
                l = int.Parse(e.CommandArgument.ToString());
                GridViewRow row = GridView1.Rows[l];
                Button lb = (Button)row.FindControl("Button3");
              
                SqlCommand cmd = new SqlCommand("update post set likess+=1 where id = @id ", con);
                cmd.Parameters.AddWithValue("@id", GridView1.Rows[l].Cells[0].Text);
                
                cmd.ExecuteNonQuery();               

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
                
            }

            if (e.CommandName == "go")
            {
               
                {
                   
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    int index;

                    index = Convert.ToInt32(e.CommandArgument.ToString());
                    GridViewRow row = GridView1.Rows[index];
                    TextBox Com = (TextBox)row.FindControl("TextBox1");
                    Button go = (Button)row.FindControl("Button7");

                    SqlCommand cmd = new SqlCommand("update post set comment=comment + '" + Session["uname"] + "'  +  ' : ' + '" + Com.Text  + "'+ '  ' where id=  @ids", con);
                    cmd.Parameters.AddWithValue("@ids", GridView1.Rows[index].Cells[0].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write(Com.Text);
                    Response.Redirect("profile.aspx");
                }
            }

            if (e.CommandName == "delete")
            {             

                {
                    
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    int index;

                    index = Convert.ToInt32(e.CommandArgument.ToString());
                    GridViewRow row = GridView1.Rows[index];
                    SqlCommand cmd = new SqlCommand("delete from post where id=  @ids", con);
                    cmd.Parameters.AddWithValue("@ids", GridView1.Rows[index].Cells[0].Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("deleted");
                    Response.Redirect("profile.aspx");
                }
            }
            if (e.CommandName == "go")
            {
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
                    Response.Write(Com.Text);
                    Response.Redirect("profile.aspx");
                }
            }

        }

            protected void Button7_Click(object sender, EventArgs e)
            {
               
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                if (FileUpload2.HasFile)
                {

                    int length = FileUpload2.PostedFile.ContentLength;
                    byte[] pic = new byte[length];
                    FileUpload2.PostedFile.InputStream.Read(pic, 0, length);
                    SqlCommand cmd = new SqlCommand("insert into post " + "(username,art,image,des)values(@name,@art,@image,@des)", con);
                    cmd.Parameters.AddWithValue("@name", profileusername.Text);
                    cmd.Parameters.AddWithValue("@art", artfield.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@image", pic);
                    cmd.Parameters.AddWithValue("@des", TextBox3.Text);
                    cmd.ExecuteNonQuery();
                    Response.Write("uploaded");
                    Response.Redirect("profile.aspx");
                }
                con.Close();

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
                // Response.Write(name);
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
            FileUpload3.Visible = true;
            Button10.Visible = true;
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            if (FileUpload3.HasFile)
            {

                int length = FileUpload3.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                FileUpload3.PostedFile.InputStream.Read(pic, 0, length);
                SqlCommand cmd = new SqlCommand("update member_master set profile_pic=@image where username='" +profileusername.Text+ "' ", con);

                cmd.Parameters.AddWithValue("@image", pic);

                cmd.ExecuteNonQuery();
                Response.Write("uploaded");
                Response.Redirect("profile.aspx");
            }
            con.Close();
        }

    } 
}