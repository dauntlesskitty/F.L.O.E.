<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChargeDetailsSummary.aspx.cs" Inherits="FLOE.Admin.ChargeDetailsSummary" %>
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
            <h1 class="page-header text-primary"><a href="Summary.aspx">Summary</a><i class="glyphicon glyphicon-chevron-right"></i>Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>
    
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="true"
            CssClass="gridview panel panel-default table table-striped" AllowSorting="True">
            <Columns>
                <asp:TemplateField HeaderText="No." HeaderStyle-CssClass="info" HeaderStyle-Width="50px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="ID" HeaderText="ID" HeaderStyle-Width="100px" InsertVisible="False" ReadOnly="True" SortExpression="ID" HeaderStyle-CssClass="info" />--%>
                <asp:BoundField DataField="Name_IC" HeaderText="Name" SortExpression="Name_IC" HeaderStyle-CssClass="info" />
                <%--<asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="Bill To Company" SortExpression="MfoCompany_Bill_To" HeaderStyle-CssClass="info" />--%>
                <asp:BoundField DataField="MfoService_Name" HeaderText="Service Name" HeaderStyle-Width="200px" SortExpression="MfoService_Name" HeaderStyle-CssClass="info" />
                <asp:TemplateField HeaderText="ID Charged" HeaderStyle-CssClass="info" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckID" runat="server" AutoPostBack="true" Checked="True" Enabled="False"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#337AB7" />
        </asp:GridView>
        <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
            SelectCommand="SELECT distinct [PUPM_Tran_Main].[ID],[PUPM_Tran_Main].[Name_IC],[PUPM_Tran_Main].[MfoCompany_Bill_To],[PUPM_Tran_Main].[MfoService_Name]
		
            FROM [dbo].[PUPM_Tran_Main]RIGHT JOIN [PUPM_Master_VerificationYear] 

            ON [PUPM_Tran_Main].[Year] = [PUPM_Master_VerificationYear].[Verification_Year] 
            WHERE [PUPM_Tran_Main].[MfoCompany_Bill_To] = @payroll_Company
            AND [PUPM_Tran_Main].[MfoService_Name] = @ServiceName
            ">
            <SelectParameters>
                <asp:QueryStringParameter Name="payroll_Company" QueryStringField="payroll_Company" />
                <asp:QueryStringParameter Name="ServiceName" QueryStringField="ServiceName" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
