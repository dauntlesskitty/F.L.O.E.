﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="PendingBUVerification.aspx.cs" Inherits="FLOE.Admin.PendingBUVerification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .gridview {
            width: 100%; 
            word-wrap:break-word;
            table-layout: fixed;
            font-size: 12px;
        }
        .text {
            text-decoration: underline;
        }
    </style>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-success"><a href="PendingBUvGraph.aspx" class="text-success">PUPM Verification</a><i class="glyphicon glyphicon-chevron-right"></i>Pending BU Verification</h1>
        </div>
    </div>

    <div class="panel panel-green">
        <div class="panel-heading">
            Filter
        </div>
        <div class="panel-body">
            <label>Company</label>
            <asp:DropDownList ID="CBPayrollComp" runat="server" AppendDataBoundItems="true" DataSourceID="SQLdsCompanyName" DataTextField="Payroll_Company" AutoPostBack="true"
                DataValueField="Payroll_Company" CssClass="form-control">
                <asp:ListItem Value="All">All</asp:ListItem>
            </asp:DropDownList><br />
        </div>
    </div>

    <%-- Start Data source for company dropdown--%>
    <asp:SqlDataSource ID="SQLdsCompanyName" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="PUPM_Select_Distinct_PayrollCompany" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="value1" DefaultValue="10" />
            <asp:SessionParameter Name="BUVERIFIED" DefaultValue="PENDING" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- End Data source for company dropdown--%>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True"
        CssClass="gridview gridview panel panel-default table table-striped" OnDataBound="OnDataBound">
        <Columns>
             <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" Visible="false" /> 
             <asp:BoundField DataField="payroll_Company" HeaderText="Company to Bill" SortExpression="payroll_Company" HeaderStyle-CssClass="success" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=Internet" 
                 DataTextField="InternetTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="InternetCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="InternetCost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=Anti-Virus" 
                 DataTextField="AntiVirusTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="AntiVirusCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="AntiVirusCost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=SmartCloud Mail" 
                 DataTextField="SmartCloudMailTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="SmartCloudMailCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="SmartCloudMailCost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=HRMS" 
                 DataTextField="HRMSTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="HRMSCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="HRMSCost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=Citrix" 
                 DataTextField="CitrixTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="CitrixCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="CitrixCost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=eDMS/KP4" 
                 DataTextField="eDMSKP4Total" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="eDMSKP4Cost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="eDMSKP4Cost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsPendingBUv.aspx?payroll_Company={0}&ServiceName=Lotus Traveler" 
                 DataTextField="LotusTravelerTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="success" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="LotusTravelerCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="LotusTravelerCost" HeaderStyle-CssClass="success" DataFormatString="{0:N}" />
        </Columns>
        <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#5CB85C" />
    </asp:GridView>
    <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="PUPM_Select_PendingBUVerificationTest" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:Parameter DefaultValue="Confirmed Summary" Name="summary" Type="String" />
            <asp:ControlParameter ControlID="CBPayrollComp" Name="payroll_Company" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
