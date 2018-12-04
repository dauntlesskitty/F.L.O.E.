<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="BillingInProgressDetails.aspx.cs" Inherits="FLOE.Admin.BillingInProgressDetails" %>
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
            <h1 class="page-header">Billing In Progress > Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="gridview panel panel-default table table-striped">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Year" HeaderText="Year" Visible="False" SortExpression="Year" HeaderStyle-CssClass="info" />
            <asp:BoundField DataField="Name_IC" HeaderText="IC Name" SortExpression="Name_IC" HeaderStyle-CssClass="info" />
            
            <asp:BoundField DataField="Division_Matrix" HeaderText="Division Matrix" SortExpression="Division_Matrix" HeaderStyle-CssClass="info" />
            <asp:BoundField DataField="ID_Name" HeaderText="Name" SortExpression="ID_Name" HeaderStyle-CssClass="info" />
            <asp:BoundField DataField="Short_Name" HeaderText="Short Name" SortExpression="Short_Name" HeaderStyle-CssClass="info" />
            <asp:BoundField DataField="Citrix_Services" HeaderText="Citrix Services" Visible="False" SortExpression="Citrix_Services" />
            <asp:BoundField DataField="Payroll_Company" HeaderText="Payroll Company" SortExpression="Payroll_Company" HeaderStyle-CssClass="info" />
       
            <asp:BoundField DataField="MfoService_Name" HeaderText="Service Name" SortExpression="MfoService_Name" HeaderStyle-CssClass="info" />
          
            <asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="Bill To Company" SortExpression="MfoCompany_Bill_To" HeaderStyle-CssClass="info" />
            <asp:BoundField DataField="Batch_No" HeaderText="Batch No" SortExpression="Batch_No" HeaderStyle-CssClass="info" />
            <asp:BoundField DataField="Reference_No" HeaderText="Reference No" SortExpression="Reference_No" HeaderStyle-CssClass="info" />
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" SelectCommand="PUPM_Select_UnbilledTest" SelectCommandType="StoredProcedure">
        <SelectParameters>
             <asp:QueryStringParameter Name="Payroll_Company" QueryStringField="Payroll_Company" Type="String" />
            <asp:QueryStringParameter Direction="InputOutput" Name="MfoService_Name" QueryStringField="ServiceName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
