<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="SOCIALnetwork.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT [id], [username], [image], [des], [art], [likess], [comment] FROM [post]">

    </asp:SqlDataSource>
    <div class="card">
        <div class="card-body">
              <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Image ID="Image1" runat="server" class="rounded float-left" alt="Cinque Terre" width="250px" ImageUrl='<%#"/;,"+Convert.ToBase64String((byte[])Eval("image")) %>'/>
                    <br />
                    <asp:Button ID="Button1" class="btn btn-link" runat="server" Text="Edit Profile Picture" OnClick="Button1_Click" ForeColor="#443E82" />
                    <asp:FileUpload ID="FileUpload3"  class="form-label" runat="server" Visible="False" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                    <asp:Button ID="Button10" class="btn btn-link" runat="server" OnClick="Button10_Click" Text="Save Changes" ForeColor="#443E82" Visible="False" />
                </div>
                
            </div>
            <div class="col-md-8">
                <div class="row">
                     <div class="col-7 text-center ">

                        <asp:Label  class="badge badge-pill badge-light" style="font-size:xx-large; font-family:Billabong;" ID="profileusername" runat="server" Text="Label" Font-Bold="True" Font-Size="X-Large" ForeColor="#443E82"></asp:Label>
                    </div>
                    <br /> <br />
                    <div class="col-7 text-center">
                        <div class="card">
                            <div class="card-body" style="background-image:url('/img/bg12345.jpg'); background-position: center; background-size: cover; height:13rem;">
                                <asp:Label ID="profilename" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                        <br />
                        <asp:Label ID="profileart" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ForeColor="#443E82" ID="Label4" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        
                    </div> 
                                        
                    
                </div>
               
            </div>
        </div>
                  <div class="col-12">                        
                        <asp:Button ID="Button2" class="btn btn-light btn-md" runat="server" Text="Followers" OnClick="Button2_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" /> 
                         &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button4" class="btn btn-light btn-md" runat="server" Text="Following" OnClick="Button4_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/>           
                    
                        <br />
                     </div>
       
        <div class="col-4">
           
           
          </div>
        <div class="col-6">
            <asp:GridView ID="GridView2"  class="table table-hover table-bordered "  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnRowCommand="GridView2_RowCommand" ToolTip="follower" Width="275px">
                <Columns>
                    <asp:BoundField DataField="follow_id" SortExpression="follow_id" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button8" class="btn btn-light btn-md" runat="server" CommandName="follow" Text="Go To  Ac" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView> 
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT [follow_id] FROM [follow] WHERE ([following_id] = @following_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="profileusername" Name="following_id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
          </div>
        <div class="col-6">
            <asp:GridView ID="GridView3" runat="server" class="table table-hover table-bordered " AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnRowCommand="GridView3_RowCommand" Width="269px">
                <Columns>
                    <asp:BoundField DataField="following_id" SortExpression="following_id" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button9" class="btn btn-light btn-md" runat="server" CommandName="following" Text="Go To Ac" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
           
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT [following_id] FROM [follow] WHERE ([follow_id] = @follow_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="profileusername" Name="follow_id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
           
          </div>
        <br />

        <div class="col-12 input-group">
            <div class="row">
                <div class="col-3 input-group">
                    <center>
                        <asp:FileUpload class="btn btn-link" ID="FileUpload2" runat="server"  style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/>
                    </center>
                </div>
                <div class="col-3 input-group ">
                    
                    <asp:DropDownList class="form-control" ID="artfield" runat="server">
                              <asp:ListItem Text="Select Art" Value="select" />
                              <asp:ListItem Text="Craft" Value="Craft" />
                              <asp:ListItem Text="Painting" Value="Painting" />
                              <asp:ListItem Text="Sketching" Value="Sketching" />
                              <asp:ListItem Text="Photography" Value="Photography" />
                              <asp:ListItem Text="Writing" Value="Writing" />
                              
                            
                           </asp:DropDownList>

                </div>
                <div class="col-3 input-group">
                    <asp:Label ID="Label5"  runat="server" Text="Description"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TextBox3" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-1">
                    <center>
                        <asp:Button ID="Button6"  class="btn btn-light" runat="server" Text="Upload" OnClick="Button7_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                    </center>
                    
                </div>
            </div>
            
        </div>
    </div>
    <br />

    <div class="container">
        <div class="row">
            <div class="col-10 ">


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT * FROM [post] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:ControlParameter ControlID="profileusername" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table table-responsive " DataKeyNames="id" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand1">
        <Columns>
            
            <asp:BoundField DataField="id" InsertVisible="False" ReadOnly="True" SortExpression="id"  ControlStyle-Width="0" ItemStyle-ForeColor="White"  >
            
            
<ControlStyle Width="0px"></ControlStyle>

<ItemStyle ForeColor="White"></ItemStyle>
            </asp:BoundField>
            
            
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-8">
                               <asp:Label ID="Label1" class="badge " style="font-size:xx-large; font-family:Billabong;" runat="server" Text='<%# Eval("username") %>' ></asp:Label><br />
                                <br />
                            </div>
                            <div class="col-4">
                                <div class="dropdown">
                                  <button class="btn btn-link dropdown-toggle" style="color:#000000" ForeColor="#443E82" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-h"></i>
                                  </button>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                   <asp:LinkButton ID="Button11" runat="server" ForeColor="#443E82" class="dropdown-item"  Text="Delete" CommandName="delete" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" Font-Bold="True"></asp:LinkButton>

                                  </div>
                                </div>
                            </div>
                            <br />
                            <div class="col-8">
                                <center>

                                </center>
                                <asp:Image ID="Image2" class="img-fluid rounded mx-auto d-block" runat="server" width="550px" ImageUrl='<%#"data:image/png;base64,"+Convert.ToBase64String((byte[])Eval("image")) %>'/>
                            </div>
                            <br />
                            <br />
                            <div class="col-8">
                                <br />
                                <center> <asp:Label ID="Label2" runat="server" ForeColor="#443E82" class="text-center" style="font-size:xx-large; font-family:Billabong;" Text='<%# Eval("des") %>'></asp:Label> </center>
                            </div>
                            <br />
                            <br />
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="form-group">
                                            
                                            <div class="input-group">
                                                 <asp:Button ID="Button3" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" class="btn btn-light" runat="server" Text='<%# "LIKES  "+Eval("likess") %>' CommandName="likecount" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"/>
                                       <asp:Label ID="Label3" runat="server" class="col-sm-2 col-form-label" Text='<%# Eval("likess") %>' Visible="False" ></asp:Label>
                                                &nbsp; &nbsp;
                                         <asp:Button ID="Button5" class="btn btn-light" runat="server" Text="COMMENT" CommandName="comment" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                                       <!-- <asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' Visible="False"></asp:Label> -->
                                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"  Text='<%# Eval("comment") %>' Visible="true" TextMode="MultiLine" Height="40px"></asp:TextBox>
                                            </div>
                                        

                                        </div>
                                       
                                    </div>
                                    <div class="col-3">
                                       
                                        <div class="form-group">
                                            
                                            <div class="input-group">
                                                
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" TextMode="MultiLine" Visible="true" Height="40px"></asp:TextBox>
                                                <asp:Button ID="Button7" class="btn btn-light" runat="server" Text="Post" Visible="true" CommandName="go" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/>
                                                
                                            </div>
                                        
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
                <ItemStyle  />
            </asp:TemplateField>
            
            
            <asp:BoundField />
            
            
        </Columns>
        
            
        

    </asp:GridView>
            </div>
        </div>
    </div>
        </div>
    </div>
  
   
</asp:Content>
