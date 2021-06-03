<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="SOCIALnetwork.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class=" rounded" style="background-image:url('/img/cover2.jpg'); background-position: center; background-size: cover;  ">
     <div class="container pb-2 pt-2"  style=" opacity:.8;>
      <div class="row">
         <div class="col-12 mx-auto">
            <div class="card">
               <div class="card-body">   
                  

                  <div class="row">
                     <div class="col-12">
                        <center>
                             <img src="img/galaxy-2728187.jpg" class="rounded-circle" alt="Cinque Terre" width="100px">
                            <br />
                           <asp:Label class="badge badge-pill badge-dark" ID="Label1" runat="server" Text="Sign Up"></asp:Label>
                            <asp:Label ID="Label2" runat="server" ForeColor="#443E82"></asp:Label>
                            <hr />
                           
                        </center>
                     </div>
                  
                     <div class="col-md-12">
                        <label>Full Name</label>&nbsp;&nbsp;&nbsp;
                        <label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Please enter name" ForeColor="Red"></asp:RequiredFieldValidator>
                         </label>                        &nbsp;
                         <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="name" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                     </div>
                     
                     <div class="col-md-12">
                        <label>Email ID</label>&nbsp;&nbsp;&nbsp;
                        <label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="  Please enter Email ID" ForeColor="Red"></asp:RequiredFieldValidator>
                         </label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;<div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                
                     <div class="col-md-12">
                        <label>Username</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="username" runat="server" placeholder="Username" ></asp:TextBox>
                        </div>
                     </div>

                       <div class="col-md-12">                        
                        <div class="form-group">
                           <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Confirm Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="password1" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>

                       <div class="col-md-12">                        
                        <div class="form-group">
                           
                        </div>
                     </div>
                  
                     <div class="col-md-12">
                        <label>Art Field</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="artfield" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Craft" Value="Craft" />
                              <asp:ListItem Text="Painting" Value="Painting" />
                              <asp:ListItem Text="Sketching" Value="Sketching" />
                              <asp:ListItem Text="Photography" Value="Photography" />
                              <asp:ListItem Text="Writing" Value="Writing" />
                              
                            
                           </asp:DropDownList>
                            <br />
                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Security Questions" Value="select" />
                              <asp:ListItem Text="What was the house number and street name you lived in as a child?" Value="What was the house number and street name you lived in as a child?" />
                              <asp:ListItem Text="What time of the day were you born? (hh:mm)" Value="What time of the day were you born? (hh:mm)" />
                              <asp:ListItem Text="What primary school did you attend?" Value="What primary school did you attend?" />
                              <asp:ListItem Text="What were the last four digits of your childhood telephone number?" Value="What were the last four digits of your childhood telephone number?" />
                              </asp:DropDownList>
                             
                            <asp:TextBox class="form-control" ID="ques" runat="server" placeholder="Answer" TextMode="SingleLine" ></asp:TextBox>    
                            
                        </div>
                     </div>                   
                  </div>                  
                  
                 
                 
                  <div class="row">
                     <div class="col-12 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary  btn-md" ID="joinpack1" runat="server" Text="Join The Pack" style="background-image:url('/img/bg1234.jpg'); background-position: center; background-size: cover;  " ForeColor="#443E82" OnClick="joinpack" />
                           </div>
                        </center>
                     </div>
                  </div>
               </div>
            </div>
          </div>        
      </div>
   </div>
</section>
</asp:Content>
