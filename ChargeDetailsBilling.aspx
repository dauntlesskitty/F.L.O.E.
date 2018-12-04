<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChargeDetailsBilling.aspx.cs" Inherits="FLOE.Admin.ChargeDetailsBilling" %>
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
            <h1 class="page-header text-primary"><a href="BillingInProgress.aspx">Billing In Progress</a><i class="glyphicon glyphicon-chevron-right"></i>Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="gridview panel panel-default table table-striped"
        AllowPaging="true">
        <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-CssClass="info" HeaderStyle-Width="50px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="ID" SortExpression="ID" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="ID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Year" HeaderText="Year" Visible="False" SortExpression="Year" HeaderStyle-CssClass="info" >
            <HeaderStyle CssClass="info"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Name_IC" HeaderText="Name" SortExpression="Name_IC" HeaderStyle-CssClass="info" >
            <HeaderStyle CssClass="info"></HeaderStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Payroll Company" SortExpression="Payroll_Company">
                <ItemTemplate>
                    <asp:Label ID="Company" runat="server" Text='<%# Bind("Payroll_Company") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle CssClass="info" />
            </asp:TemplateField>
       
            <asp:BoundField DataField="MfoService_Name" HeaderText="Service Name" SortExpression="MfoService_Name" HeaderStyle-CssClass="info" >
            <HeaderStyle CssClass="info"></HeaderStyle>
            </asp:BoundField>
          
            <asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="Company to Bill" SortExpression="MfoCompany_Bill_To" HeaderStyle-CssClass="info" >
            <HeaderStyle CssClass="info"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Batch_No" HeaderText="Batch No" SortExpression="Batch_No" HeaderStyle-CssClass="info" >
            <HeaderStyle CssClass="info"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Reference_No" HeaderText="Reference No" SortExpression="Reference_No" HeaderStyle-CssClass="info" >
            <HeaderStyle CssClass="info"></HeaderStyle>
            </asp:BoundField>
        </Columns>
        <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#337AB7" />
    </asp:GridView>
    <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>
    <br />
    
    <asp:Button runat="server" ID="btnVerify" text="Billed" OnClick="btn_Process" ControlStyle-CssClass="btn btn-primary" /><br /><br /><br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" SelectCommand="PUPM_Select_UnbilledTest" SelectCommandType="StoredProcedure">
        <SelectParameters>
             <asp:QueryStringParameter Name="Payroll_Company" QueryStringField="Payroll_Company" Type="String" />
            <asp:QueryStringParameter Direction="InputOutput" Name="MfoService_Name" QueryStringField="ServiceName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
