<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SOCIALnetwork.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p-1" >
        <div class="row">
            <div class="col-12">
                <div class="card  text-black ">
                    <img class="card-img" src="img/painting.jpg" alt="Card image" style="height: 37rem;">
                    <div class="card-img-overlay ">  
                        <div class="row">
                            <div class="col-9">
                                <center>
                                    <h5 class="card-title" style="font-weight: 600; font-size: 3rem;">Are you an Artist?</h5>
                                    <p class="card-text" style="font-weight: 600; font-size: 2rem;"> Give your art the attention it deserves. <br />
                                      Discover amazing opportunities  <br />
                                    Join Artisans Pack. <br />
                                    </p>
                                 </center>
                        
                            </div>
                             <div class="col-3">                
                                <div class="card " style="opacity: .8;">
                                    <img src="img/login1wolf.jpg"  class="card-img-top rounded-circle " alt="Card image cap" style="height: 12rem;">
                                    <div class="card-body">                        
                        <h3 class="card-title">Artisans Pack</h3>
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <div class=""> 
                                           <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                                        <br />
                                        <asp:TextBox  CssClass="form-control" ID="uname" runat="server" placeholder="Username" ></asp:TextBox>
                                        <br />
                                        <asp:TextBox  CssClass="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    
                                    <asp:Button class="btn btn-outline-dark btn-block" ID="loginpack" runat="server" Text="Login To Pack" OnClick="loginpack_Click" />
                                    
                                    <div id="shubh"></div>

                                </div>
                            </div>
                        </div>

                         
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Button class="btn btn-outline-dark btn-block" ID="joinpack" runat="server" Text="Join The Pack" PostBackUrl="signup.aspx"  />
                                    <center>                                        
                                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="" PostBackUrl="forget.aspx">Forgot Password?</asp:LinkButton>
                                    </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
                             
                        </div>
                        
                    </div>
                </div>
            </div>

            <!-- Login Part -->
           
        </div>
    </div>
</asp:Content>
