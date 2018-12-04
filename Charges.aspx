<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="Charges.aspx.cs" Inherits="FLOE.Admin.Charges" %>
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
            <h1 class="page-header">Charges</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>

    <div>
        <div class="panel panel-success">
            <div class="panel-heading">
                Filter
            </div>
            <div class="panel-body">
                <label>Services</label><br />
                <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" 
                DataTextField="Service_Name" DataValueField="Service_Name" 
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Value="1">All Services</asp:ListItem>
                </asp:DropDownList><br />
            </div>
        </div>

        <!--Non Filter Data Panel -->
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" allowcolumnresize="true" 
                CssClass="gridview panel panel-default table table-striped">
                <Columns>
                    <asp:BoundField DataField="Service_Name" HeaderText="Name" SortExpression="Service_Name" HeaderStyle-CssClass="success" />
                    <asp:BoundField DataField="Service_Charge" HeaderText="Charge (RM)" SortExpression="Service_Charge" HeaderStyle-CssClass="success" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        
        <!-- Filter Data Panel -->
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" 
                CssClass="gridview panel panel-default table table-striped">
                <Columns>
                    <asp:BoundField DataField="Service_Name" HeaderText="Name" SortExpression="Service_Name" HeaderStyle-CssClass="success" />
                    <asp:BoundField DataField="Service_Charge" HeaderText="Charge (RM)" SortExpression="Service_Charge" HeaderStyle-CssClass="success" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <br />
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="SELECT [Service_Name] FROM [PUPM_Master_Charge]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="SELECT [Service_Name], [Service_Charge] FROM [PUPM_Master_Charge]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        SelectCommand="SELECT [Service_Name], [Service_Charge] FROM [PUPM_Master_Charge] WHERE ([Service_Name] = @Service_Name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Service_Name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
