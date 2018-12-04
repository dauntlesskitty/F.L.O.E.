<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FLOE.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content {
            width: 100%;
            height: 100%;
        }
    </style>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Dashboard</h1>
        </div> 
    </div>
    
    <!-- Link Buttons -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-comments fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><asp:Label runat="server" ID="sumAMT"></asp:Label></div>
                            <asp:Label ID="Label1" runat="server" Text="Summary"></asp:Label>
                        </div>
                    </div>
                </div>
                <a href="Summary.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
                
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><asp:Label runat="server" ID="pBUAMT"></asp:Label></div>
                            <asp:Label ID="Label2" runat="server" Text="Pending BU Verification"></asp:Label>
                        </div>
                    </div>
                </div>
                <a href="PendingBUvGraph.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
                
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-shopping-cart fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><asp:Label runat="server" ID="itsscAMT"></asp:Label></div>
                            <asp:Label ID="Label3" runat="server" Text="Pending ITSSC Verification"></asp:Label>
                        </div>
                    </div>
                </div>
                <a href="PendingITSSCVerification.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
                
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-support fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><asp:Label runat="server" ID="CRLAMT"></asp:Label></div>
                            <asp:Label ID="Label4" runat="server" Text="Change Request List"></asp:Label>
                        </div>
                    </div>
                </div>
                <a href="ChangeRequestList.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-support fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><asp:Label runat="server" ID="BIPAMT"></asp:Label></div>
                            <asp:Label ID="Label5" runat="server" Text="Billing in Progress"></asp:Label>
                        </div>
                    </div>
                </div>
                <a href="BillingInProgress.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><asp:Label runat="server" ID="BilledAMT"></asp:Label></div>
                            <asp:Label ID="Label7" runat="server" Text="Billed"></asp:Label>
                        </div>
                    </div>
                </div>
                <a href="Billed.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- /.row -->

    <!-- Charts and Graphs -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Trending Services and Spending Forecast</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-default">
                <iframe width="1200" height="720" src="https://app.powerbi.com/view?r=eyJrIjoiMWFiNzkwZGQtZDhkMi00NDQ0LTg4NDktNmY5YTI1ZWQyNTkxIiwidCI6Ijc1ZGVlNDczLTQwMGYtNGU2NS1iMjZkLTBmNjY2MTIyYzA3MiIsImMiOjEwfQ%3D%3D"></iframe>
            </div>
        </div>
    </div>
</asp:Content>