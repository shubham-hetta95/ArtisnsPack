<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="SOCIALnetwork.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="aboutus rounded pb-6 pt-1" style="background-image:url('/img/cover2.jpg'); background-position: unset; background-size: cover;  ">
    <div class="container pt-2 pb-2 rounded">
        <div class="row">
            <div class="col-2">
                <div class="card" style=" opacity:.85; ">
                    <div class="card-body">
                        <button class="btn btn-link" style="color:#000000;" onclick="editprofile()">Edit Profile</button>                    
                        
                    </div>
                </div>
            </div>
           
            <div class="col-md-10" >                         


                 <div id="editprofile" class="card"  style=" opacity:.85;   ">
                    <div class="card-body" >
                        <div class="form-group">
                           
                            <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <br />
                            <!--
                            <label>Username</label>                            
                            <asp:TextBox class="form-control" ID="TextBox1" runat="server" ></asp:TextBox>
                            <br />
                             -->

                            <label>Name</label> 
                            <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder=""></asp:TextBox>    
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Max Character Length 200." ForeColor="Red" ValidationExpression="^[\s\S]{0,200}$"></asp:RegularExpressionValidator>
                            <br />

                            <label>Bio (Max 200 Character.)</label> 
                            <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="" TextMode="MultiLine"></asp:TextBox>
                            <br />

                            <center>
                                <asp:Button class="btn btn-primary btn-md" ID="editprofile" runat="server" Text="Edit Profile" OnClick="editprofile_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                                <br />
                                
                            </center>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="col-2" >
                <div class="card" style=" opacity:.85; ">
                    <div class="card-body">
                        
                        <button class="btn btn-link" style="color:#000000;" onclick="changepassword()">Change Password</button>
                        
                    </div>
                </div>
            </div>
            <div class="col-10">
                <div id="changepassword" class="card"  style=" opacity:.85; ">
                <div class="card-body" >
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <br />
                            <label>Old Password</label>                            
                            <asp:TextBox class="form-control" ID="password" runat="server" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password1" ControlToValidate="TextBox2" ErrorMessage="Both Password Not Matching" ForeColor="Red"></asp:CompareValidator>
                            <br />

                            <label>New Password</label> 
                            <asp:TextBox class="form-control" ID="password1" runat="server" placeholder="New Password" TextMode="Password" ></asp:TextBox>    
                            <br />

                            <label>Confirm New Password</label> 
                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Confirm New Password" TextMode="Password" ></asp:TextBox>
                            <br />

                            <center>
                                <asp:Button class="btn btn-primary btn-md" ID="Button2" runat="server" Text="Change Password" OnClick="changepassword_Click" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" Font-Bold="True" />
                                <br />
                                <asp:LinkButton class="btn  btn-link btn-md" ID="LinkButton3" runat="server" PostBackUrl="forget.aspx" ForeColor="#443E82" >Forgot Password?</asp:LinkButton>
                                <br />
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
