<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="PendingBUvGraph.aspx.cs" Inherits="FLOE.Admin.PendingBUvGraph" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-success">PUPM Verification</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12"> 
            <asp:Button runat="server" ID="BUv" text="Pending BU Verification" ControlStyle-CssClass="btn btn-success shift" PostBackUrl="~/Admin/PendingBUVerification.aspx" /><br />
        </div>
    </div><br />

    <div>
        <iframe width="1210" height="600" src="https://app.powerbi.com/view?r=eyJrIjoiZWQwNGNiNmItMDJhYi00OGYyLWE1NDktZWY0MGZhYWZkZGMwIiwidCI6Ijc1ZGVlNDczLTQwMGYtNGU2NS1iMjZkLTBmNjY2MTIyYzA3MiIsImMiOjEwfQ%3D%3D"></iframe>
    </div>
</asp:Content>
