<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="profile1.aspx.cs" Inherits="SOCIALnetwork.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT [id], [username], [image], [des], [art], [likess], [comment] FROM [post]">

    </asp:SqlDataSource>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Image ID="Image1" runat="server" class="rounded float-left" alt="Cinque Terre" style="height: 15rem;" ImageUrl='<%#"/;,"+Convert.ToBase64String((byte[])Eval("image")) %>'/>
                   
                </div>
                
            </div>
            <div class="col-md-8">
                <div class="row">
                     <div class="col-7 text-center">
                        <asp:Label ID="profileusername" class="badge badge-pill badge-light" style="font-size:xx-large; font-family:Billabong;" runat="server" Text="Label" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                         &nbsp; &nbsp;
                         <asp:Button class="btn btn-outline-dark btn-sm" ID="Button1" runat="server" Text="Follow" OnClick="Button1_Click" />                       
                    </div>
                    <br />
                    <br />
                    <div class="col-7 text-center">
                        <div class="card">
                            <div class="card-body"  style="background-image:url('/img/bg12345.jpg'); background-position: center; background-size: cover; height:13rem;">
                                <asp:Label   ID="profilename" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label> 
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
        <div class="col-6">
            <br />
                 <asp:Button ID="Button2" class="btn btn-outline-primary " runat="server" Text="Followers" OnClick="Button2_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/> 
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" class="btn btn-outline-primary " runat="server" Text="Following" OnClick="Button4_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"/>
            </center>
            <br />
          </div>
        <div class="col-4">
           
           
          </div>
        <div class="col-6">
            <asp:GridView ID="GridView2"  class="table table-hover table-bordered " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnRowCommand="GridView2_RowCommand" ToolTip="follower" Width="276px">
                <Columns>
                    <asp:BoundField DataField="follow_id" HeaderText="follow_id" SortExpression="follow_id" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button8" class="btn btn-outline-primary  btn-sm" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" runat="server"   CommandName="follow" Text="Go To  Ac" CommandArgument="<%#((GridViewRow)Container).RowIndex %>"/>
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
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnRowCommand="GridView3_RowCommand" Width="264px">
                <Columns>
                    <asp:BoundField DataField="following_id" HeaderText="following_id" SortExpression="following_id" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button9" class="btn btn-outline-primary btn-sm" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"  runat="server" CommandName="following" Text="Go To Ac" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />
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

       
    </div>
    <br />

    <div class="container">
        <div class="row">
            <div class="col">
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT * FROM [post] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:ControlParameter ControlID="profileusername" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered  table-striped table table-responsive " AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand1" AllowPaging="True" CellPadding="4" GridLines="None" ForeColor="#333333" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            
            <asp:BoundField DataField="id" InsertVisible="False" ReadOnly="True" SortExpression="id" ControlStyle-Width="0" ItemStyle-ForeColor="White" >
            
            
<ControlStyle Width="0px"></ControlStyle>

<ItemStyle ForeColor="White"></ItemStyle>
            </asp:BoundField>
            
            
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <asp:Label ID="Label1" runat="server" style="font-size:xx-large; font-family:Billabong;" Text='<%# Eval("username") %>' Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-12">
                                <asp:Image ID="Image2" class="img-fluid" runat="server" ImageUrl='<%#"data:image/png;base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' BorderStyle="Groove"/>
                            </div>
                            <div class="col-12">
                                <center><asp:Label ID="Label2" ForeColor="#443E82" class="text-center" style="font-size:xx-large; font-family:Billabong;" runat="server" Text='<%# Eval("des") %>'></asp:Label></center>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="form-group">
                                            
                                            <div class="input-group">
                                                 <asp:Button ID="Button3" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"  class="btn btn-info" runat="server" Text='<%# "LIKES  "+Eval("likess") %>' CommandName="likecount" CommandArgument="<%#((GridViewRow)Container).RowIndex %>"/>
                                        <asp:Label ID="Label3" runat="server" class="col-sm-2 col-form-label" Text='<%# Eval("likess") %>' Visible="False" ></asp:Label>
                                                &nbsp;
                                         <asp:Button ID="Button5" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"  class="btn btn-info" runat="server" Text="COMMENT" CommandName="comment" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />
                                       <!-- <asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' Visible="False"></asp:Label> -->
                                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"  Text='<%# Eval("comment") %>' Visible="true" TextMode="MultiLine" Height="40px"></asp:TextBox>
                                            </div>
                                        

                                        </div>
                                       
                                    </div>
                                    <div class="col-3">
                                       
                                        <div class="form-group">
                                            
                                            <div class="input-group">
                                                
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" TextMode="MultiLine" Visible="true" Height="40px"></asp:TextBox>
                                                <asp:Button ID="Button7" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True"  class="btn btn-info" runat="server" Text="Post" Visible="true" CommandName="go" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />
                                                
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
</asp:Content>
