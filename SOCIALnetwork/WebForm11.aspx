﻿<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WebForm11.aspx.cs" Inherits="SOCIALnetwork.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show and hide div with JavaScript</title>
<script>

    var button_beg = '<button id="button" onclick="showhide()">', button_end = '</button>';
    var show_button = 'Show', hide_button = 'Hide';
    function showhide() {
        var div = document.getElementById( "hide_show" );
        var showhide = document.getElementById( "showhide" );
        if ( div.style.display !== "none" ) {
            div.style.display = "none";
            button = show_button;
            showhide.innerHTML = button_beg + button + button_end;
        } else {
            div.style.display = "block";
            button = hide_button;
            showhide.innerHTML = button_beg + button + button_end;
        }
    }
    function setup_button( status ) {
        if ( status == 'show' ) {
            button = hide_button;
        } else {
            button = show_button;
        }
        var showhide = document.getElementById( "showhide" );
        showhide.innerHTML = button_beg + button + button_end;
    }
    window.onload = function () {
        setup_button( 'hide' );
        showhide(); // if setup_button is set to 'show' comment this line
    }
</script>
</head>
<body>
    <div id="showhide"></div>
    <div id="hide_show">
        <p>This div will be show and hide on button click</p>
    </div>
</body>
</html>
</asp:Content>
