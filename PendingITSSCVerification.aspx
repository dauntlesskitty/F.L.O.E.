﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="PendingITSSCVerification.aspx.cs" Inherits="FLOE.Admin.PendingITSSCVerification" %>
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
    </style>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-warning">Pending ITSSC Verification</h1>
        </div>
    </div>

    <div class="panel panel-yellow">
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
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        CssClass="gridview panel panel-default table table-striped" OnDataBound="OnDataBound">
        <Columns>
             <asp:BoundField DataField="year" HeaderText="year" Visible="false" SortExpression="year" /> 
             <asp:BoundField DataField="payroll_Company" HeaderText="Company to Bill" SortExpression="payroll_Company" HeaderStyle-CssClass="warning" />
             
             <%--<asp:BoundField DataField="InternetTotal" HeaderText="InternetTotal" ReadOnly="True" SortExpression="InternetTotal" />--%>
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=Internet" 
                 DataTextField="InternetTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="InternetCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="InternetCost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />

             <%--<asp:BoundField DataField="AntiVirusTotal" HeaderText="AntiVirusTotal" ReadOnly="True" SortExpression="AntiVirusTotal" />--%>
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=Anti-Virus" 
                DataTextField="AntiVirusTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="AntiVirusCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="AntiVirusCost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />

             <%--<asp:BoundField DataField="SmartCloudMailTotal" HeaderText="SmartCloudMailTotal" ReadOnly="True" SortExpression="SmartCloudMailTotal" />--%>
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=SmartCloud Mail" 
                DataTextField="SmartCloudMailTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="SmartCloudMailCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="SmartCloudMailCost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />

             <%--<asp:BoundField DataField="HRMSTotal" HeaderText="HRMSTotal" ReadOnly="True" SortExpression="HRMSTotal" />--%>
            <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=HRMS" 
                DataTextField="HRMSTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="HRMSCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="HRMSCost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />

             <%--<asp:BoundField DataField="CitrixTotal" HeaderText="CitrixTotal" ReadOnly="True" SortExpression="CitrixTotal" />--%>
            <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=Citrix" 
                DataTextField="CitrixTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="CitrixCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="CitrixCost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />

             <%--<asp:BoundField DataField="eDMSKP4Total" HeaderText="eDMSKP4Total" ReadOnly="True" SortExpression="eDMSKP4Total" />--%>
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=eDMS/KP4" 
                DataTextField="eDMSKP4Total" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="eDMSKP4Cost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="eDMSKP4Cost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />

             <%--<asp:BoundField DataField="LotusTravelerTotal" HeaderText="LotusTravelerTotal" ReadOnly="True" SortExpression="LotusTravelerTotal" />--%>
             <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsITSSCv.aspx?payroll_Company={0}&ServiceName=Lotus Traveler" 
                DataTextField="LotusTravelerTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="warning" ControlStyle-CssClass="text" />
             <asp:BoundField DataField="LotusTravelerCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="LotusTravelerCost" HeaderStyle-CssClass="warning" DataFormatString="{0:N}" />
        </Columns>
        <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#F0AD4E" />
    </asp:GridView>
    <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="PUPM_Select_ITSSCFeedbackTest" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:Parameter DefaultValue="Confirmed Summary" Name="summary" Type="String" />
            <asp:ControlParameter ControlID="CBPayrollComp" Name="payroll_Company" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>