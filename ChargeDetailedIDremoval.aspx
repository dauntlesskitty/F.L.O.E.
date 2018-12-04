<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChargeDetailedIDremoval.aspx.cs" Inherits="FLOE.Admin.ChargeDetailedIDremoval" %>
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
            <h1 class="page-header text-warning"><a href="IDremoval.aspx" class="text-warning">ID Removal Summary</a><i class="glyphicon glyphicon-chevron-right"></i>Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True"
        CssClass="gridview panel panel-default table table-striped" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-CssClass="warning" HeaderStyle-Width="50px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" HeaderStyle-CssClass="warning" ReadOnly="true" InsertVisible="False" Visible="false"></asp:BoundField>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" HeaderStyle-CssClass="warning" Visible="false">
            </asp:BoundField>
            <asp:BoundField DataField="Name_IC" HeaderText="Name_IC" SortExpression="Name_IC" HeaderStyle-CssClass="warning">
            </asp:BoundField>
            <asp:BoundField DataField="ID_Name" HeaderText="ID_Name" SortExpression="ID_Name"/>
            <asp:BoundField DataField="Short_Name" HeaderText="Short_Name" SortExpression="Short_Name" HeaderStyle-CssClass="warning" >
            </asp:BoundField>
            <asp:BoundField DataField="Payroll_Company" HeaderText="Payroll_Company" SortExpression="Payroll_Company" />
            <asp:BoundField DataField="MfoService_Name" HeaderText="MfoService_Name" SortExpression="MfoService_Name" />
            <asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="MfoCompany_Bill_To" SortExpression="MfoCompany_Bill_To" />
            <asp:BoundField DataField="Justification" HeaderText="Justification" SortExpression="Justification" />
            <asp:BoundField DataField="Reference_No" HeaderText="Reference_No" SortExpression="Reference_No" HeaderStyle-CssClass="warning">
            </asp:BoundField>
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
           
        </Columns>
        <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#F0AD4E" />
    </asp:GridView>
    <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" SelectCommand="PUPM_Select_Removal_ID" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Payroll_Company" QueryStringField="Payroll_Company" Type="String" />
            <asp:QueryStringParameter Direction="InputOutput" Name="MfoService_Name" QueryStringField="ServiceName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="SELECT [Company_Code],[Company_Name] as MfoCompany_Bill_To  FROM [PUPM_Master_Company]"></asp:SqlDataSource>
</asp:Content>
