<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="HistoryLog.aspx.cs" Inherits="FLOE.Admin.HistoryLog" %>
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
            <h1 class="page-header">History Log</h1>
        </div>
    </div>

        <div class="panel panel-info">
            <div class="panel-heading">
                Filter
            </div>
            <div class="panel-body">
                <label>Services</label>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                CssClass="form-control" DataSourceID="SqlDataSource2"  DataTextField="MfoService_Name" DataValueField="MfoService_Name"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" SelectCommand="PUPM_Select_Distinct_ServiceName" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="value2" Type="String" DefaultValue="10" />
                        <asp:Parameter DefaultValue="BUVERIFIED" Name="BUVERIFIED" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <label>IC Name</label>

                <asp:TextBox ID="InputName" runat="server" class="form-control" placeholder="Enter IC Name"></asp:TextBox><br />
                <label>Reference Number</label>
                <asp:TextBox ID="refNum" runat="server" class="form-control" placeholder="Enter Reference Number"></asp:TextBox><br />
                <asp:Button ID="Search_Button" runat="server" OnClick="Button1_Click" Text="Search" CssClass="btn btn-info" />
            </div>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" allowcolumnresize="true" 
            CssClass="gridview panel panel-default table table-striped" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" HeaderStyle-CssClass="info" Visible="false"/>
                <asp:BoundField DataField="LfoRefNo" HeaderText="Reference Number" SortExpression="LfoRefNo" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LDate" HeaderText="Date" SortExpression="LDate" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LAction" HeaderText="Action" SortExpression="LAction" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LActionBy" HeaderText="Action By" SortExpression="LActionBy" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LRemarks" HeaderText="Remarks" SortExpression="LRemarks" HeaderStyle-CssClass="info" />
            </Columns>
            <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#5BC0DE" />
        </asp:GridView>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" allowcolumnresize="true" 
            CssClass="gridview panel panel-default table table-striped" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" HeaderStyle-CssClass="info" Visible="false"/>
                <asp:BoundField DataField="LfoRefNo" HeaderText="Reference Number" SortExpression="LfoRefNo" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LDate" HeaderText="Date" SortExpression="LDate" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LAction" HeaderText="Action" SortExpression="LAction" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LActionBy" HeaderText="Action By" SortExpression="LActionBy" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="LRemarks" HeaderText="Remarks" SortExpression="LRemarks" HeaderStyle-CssClass="info" />
            </Columns>
            <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#5BC0DE" />
        </asp:GridView>

        <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
            SelectCommand="PUPM_Select_HistoryLog" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
