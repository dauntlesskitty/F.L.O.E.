<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="BilledDetails.aspx.cs" Inherits="FLOE.Admin.BilledDetails" %>
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
            <h1 class="page-header">Billed > Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="gridview panel panel-default table table-striped">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" Visible="false" SortExpression="ID" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" Visible="false" />
            <asp:BoundField DataField="Name_IC" HeaderText="IC Name" SortExpression="Name_IC" HeaderStyle-CssClass="warning" />
            
            <asp:BoundField DataField="Payroll_Company" HeaderText="Payroll Company" SortExpression="Payroll_Company" HeaderStyle-CssClass="warning" />
            <asp:BoundField DataField="MfoService_Name" HeaderText="Service Name" SortExpression="MfoService_Name" HeaderStyle-CssClass="warning" />
            <asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="Bill To Company" SortExpression="MfoCompany_Bill_To" HeaderStyle-CssClass="warning" />
            <asp:BoundField DataField="Batch_No" HeaderText="Batch No" SortExpression="Batch_No" HeaderStyle-CssClass="warning" />
            <asp:BoundField DataField="Reference_No" HeaderText="Reference No" SortExpression="Reference_No" HeaderStyle-CssClass="warning" />
       
            <asp:BoundField DataField="MfoStatus_IDQ1Q2" HeaderText="Status" SortExpression="MfoStatus_IDQ1Q2" Visible="false" />
          
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" SelectCommand="PUPM_Select_Billed" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Payroll_Company" QueryStringField="Payroll_Company" Type="String" />
            <asp:QueryStringParameter Direction="InputOutput" Name="MfoService_Name" QueryStringField="ServiceName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
