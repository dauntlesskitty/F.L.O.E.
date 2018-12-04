<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChargeDetailsPendingBUv.aspx.cs" Inherits="FLOE.Admin.ChargeDetailsPendingBUv" %>
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
            <h1 class="page-header text-success"><a href="PendingBUvGraph.aspx" class="text-success">PUPM Verification</a><i class="glyphicon glyphicon-chevron-right"></i><a href="PendingBUVerification.aspx" class="text-success">Pending BU Verification</a><i class="glyphicon glyphicon-chevron-right"></i>Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>
                         
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" AllowMultiRowSelection="true" EditMode="EditForms" DataSourceID="SqlDataSource1" 
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated"
        CssClass="gridview panel panel-default table table-striped" AllowSorting="True" AllowPaging="true">    
        <Columns>  
            <asp:TemplateField HeaderText="No." HeaderStyle-CssClass="success" HeaderStyle-Width="50px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Name_IC" ReadOnly="true" HeaderText="Name" SortExpression="Name_IC" HeaderStyle-CssClass="success" />

            <%--CheckBox--%>
            <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="ID Charged" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                <%--<HeaderTemplate>
                    <asp:CheckBox ID="CheckAllID" runat="server" />
                </HeaderTemplate>--%>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckID" runat="server" AutoPostBack="true"></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ID" SortExpression="ID" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="IDlbl" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" Visible="false" />
            
           <%-- <asp:BoundField DataField="Payroll_Company" ReadOnly="true" HeaderText="Company to Bill" SortExpression="Payroll_Company" HeaderStyle-CssClass="success" />--%>
            <asp:TemplateField HeaderText="Company to Bill" SortExpression="MfoCompany_Bill_To" HeaderStyle-CssClass="success">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MfoCompany_Bill_To")%>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddl1" DataTextField="MfoCompany_Bill_To" DataValueField="MfoCompany_Bill_To" DataSourceID="SqlDataSource2" runat="server" 
                        SelectedValue='<%#DataBinder.Eval(Container.DataItem, "MfoCompany_Bill_To")%>' CssClass="form-control"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="MfoService_Name" ReadOnly="true" HeaderText="Service Name" SortExpression="MfoService_Name" HeaderStyle-CssClass="success" />
            <asp:CheckBoxField ReadOnly="false" Visible="false" HeaderText="Selected" SortExpression="Selected" HeaderStyle-CssClass="success" />
            
            <asp:TemplateField HeaderText="Justification" SortExpression="Justification" HeaderStyle-CssClass="success" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Justification") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="JustifyLbl" runat="server" Text='<%# Bind("Justification") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MfoStatus_IDQ1Q2" HeaderText="MfoStatus_IDQ1Q2" SortExpression="MfoStatus_IDQ1Q2" ReadOnly="true" Visible="false" />
            <asp:CommandField EditText="Justify" ShowEditButton="True"  HeaderStyle-CssClass="success" ControlStyle-CssClass="btn btn-success btn-xs"/>
         </Columns>
        <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#5CB85C" />
    </asp:GridView>
    <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>
    <br />

    <asp:Button runat="server" ID="btnVerify" text="Confirm for Billing" OnClick="btnVerifyFunc" ControlStyle-CssClass="btn btn-success" />
    <asp:Button runat="server" ID="btnRequest" text="Submit for ITSSC Verification" OnClick="btnRequestFunc" ControlStyle-CssClass="btn btn-success" /><br /><br /><br />
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="PUPM_Select_PendingBUVerification" SelectCommandType="StoredProcedure"
        UpdateCommandType="StoredProcedure" UpdateCommand= "PUPM_Update_Justification">
        <SelectParameters>
            <asp:QueryStringParameter Name="Payroll_Company" QueryStringField="Payroll_Company" Type="String" />
            <asp:QueryStringParameter Direction="InputOutput" Name="MfoService_Name" QueryStringField="ServiceName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="SELECT [Company_Code],[Company_Name] as MfoCompany_Bill_To  FROM [PUPM_Master_Company]"></asp:SqlDataSource>
</asp:Content>
