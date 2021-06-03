<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="explore.aspx.cs" Inherits="SOCIALnetwork.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-3">
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:artcommunityConnectionString %>" SelectCommand="SELECT * FROM [post]">
    </asp:SqlDataSource>
        <center>
            <div class="row">
                <div class="col-12">
                     <asp:Label ID="Label1" class="border badge badge-light" runat="server" style="font-size:xx-large; font-family:Billabong;" ForeColor="#443E82" Text="Discover people around you."></asp:Label>
                </div>
            </div>
        </center>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table table-responsive " DataKeyNames="id" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand1" AllowPaging="True" >
        <Columns>

            
            <asp:BoundField DataField="id" InsertVisible="False" ReadOnly="True" SortExpression="id" ControlStyle-Width="0" ItemStyle-ForeColor="White">
            
            
<ControlStyle BackColor="White" ForeColor="White"></ControlStyle>
            </asp:BoundField>
            
            
            <asp:TemplateField >
                <ItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                    <asp:LinkButton ID="LinkButton1" runat="server" style="font-size:xx-large; font-family:Billabong;" Text='<%# Eval("username") %>' Font-Bold="False" CommandName="user" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" ForeColor="Black"></asp:LinkButton>
                                <br />
                            </div>
                            <div class="col-12">
                                <asp:Image ID="Image2" runat="server" class="img-fluid rounded mx-auto d-block" ImageUrl='<%#"data:image/png;base64,"+Convert.ToBase64String((byte[])Eval("image")) %>'/>
                            </div>
                            <div class="col-12">
                                <center> <asp:Label ID="Label2" runat="server" ForeColor="#443E82" class="text-center" style="font-size:xx-large; font-family:Billabong;" Text='<%# Eval("des") %>'></asp:Label> </center>
                               
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="form-group">
                                            
                                            <div class="input-group">
                                                 <asp:Button ID="Button3" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" class="btn btn-info" runat="server" Text='<%# "LIKES  "+Eval("likess") %>' CommandName="likecount" CommandArgument="<%#((GridViewRow)Container).RowIndex %>"/>
                                      
                                                &nbsp;
                                         <asp:Button ID="Button5" class="btn btn-info" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" runat="server" Text="COMMENT" CommandName="comment" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />
                                       <!-- <asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' Visible="False"></asp:Label> -->
                                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"  Text='<%# Eval("comment") %>' Visible="true" TextMode="MultiLine" Height="40px"></asp:TextBox>
                                            </div>
                                        

                                        </div>
                                       
                                    </div>
                                    <div class="col-3">
                                       
                                        <div class="form-group">
                                            
                                            <div class="input-group">
                                                
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" TextMode="MultiLine" Visible="true" Height="40px"></asp:TextBox>
                                                <asp:Button ID="Button7" class="btn btn-info" runat="server" Text="Post" Visible="true" CommandName="go" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                                                
                                            </div>
                                        
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:TemplateField>
            
            
            <asp:BoundField />
            
            
        </Columns>

        
    </asp:GridView>
    </div>
       
</asp:Content>
