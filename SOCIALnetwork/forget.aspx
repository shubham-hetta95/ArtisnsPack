<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="SOCIALnetwork.forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="aboutus rounded pb-2 pt-1" style="background-image:url('/img/cover2.jpg'); background-position: unset; background-size: cover;  ">
     <div class="container pb-1">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card"style=" opacity:.85;" >
                    <div class="card-body">
                        <div class="form-group" style="opacity: .85;">
                            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                            <label>Username</label> 
                            <asp:TextBox class="form-control" ID="uname" runat="server" placeholder="Username" TextMode="SingleLine" ></asp:TextBox>    
                            <br />

                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Security Questions" Value="select" />
                              <asp:ListItem Text="What was the house number and street name you lived in as a child?" Value="What was the house number and street name you lived in as a child?" />
                              <asp:ListItem Text="What time of the day were you born? (hh:mm)" Value="What time of the day were you born? (hh:mm)" />
                              <asp:ListItem Text="What primary school did you attend?" Value="What primary school did you attend?" />
                              <asp:ListItem Text="What were the last four digits of your childhood telephone number?" Value="What were the last four digits of your childhood telephone number?" />
                              </asp:DropDownList>                           
                            
                            <asp:TextBox class="form-control" ID="ans" runat="server" placeholder="Answer" TextMode="SingleLine" ></asp:TextBox>    
                            <br />

                            <label>New Password</label> 
                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="New Password" TextMode="Password" ></asp:TextBox>    
                            <br />

                            <label>Confirm New Password</label> 
                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Confirm New Password" TextMode="Password" ></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="New Password Not Matching" ForeColor="Red"></asp:CompareValidator>
                            <br />

                            <center>
                                <asp:Button class="btn btn-primary btn-md" ID="changepassword" runat="server" Text="Set New Password" OnClick="changepassword_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                                <br />
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                                <br />
                                <br />
                                <br />
                            </center>
                        </div>
                    </div>
                </div>

            </div>            
    </div>
</asp:Content>
