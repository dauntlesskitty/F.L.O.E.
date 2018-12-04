<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="FLOE.Admin.Summary" %>
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
            <h1 class="page-header text-primary">Summary</h1>
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            Filter
        </div>
        <div class="panel-body">
            <label>Services</label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="form-control">
                <asp:ListItem Value="Summary Draft">All Services</asp:ListItem>
                <asp:ListItem Value="Confirmed Summary">Verified Services</asp:ListItem>
            </asp:DropDownList><br />
        </div>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowGroup="True"
        CssClass="gridview gridview panel panel-default table table-striped" OnDataBound="OnDataBound" AllowPaging="True" >
            <Columns>
                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" Visible="false" HeaderStyle-CssClass="info" />
                <asp:BoundField DataField="payroll_Company" HeaderText="Company to Bill" SortExpression="payroll_Company" HeaderStyle-CssClass="info" />

                <%-- Internet --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=Internet" 
                    DataTextField="InternetTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="InternetCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="InternetCost" 
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />
                
                <%-- AntiVirus --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=Anti-Virus" 
                    DataTextField="AntiVirusTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="AntiVirusCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="AntiVirusCost" 
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />
                
                <%-- SmartCloud Mail --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=SmartCloud Mail" 
                    DataTextField="SmartCloudMailTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="SmartCloudMailCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="SmartCloudMailCost" 
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />

                <%-- HRMS --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=HRMS" 
                    DataTextField="HRMSTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="HRMSCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="HRMSCost"
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />

                <%-- Citrix --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=Citrix" 
                    DataTextField="CitrixTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="CitrixCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="CitrixCost"
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />

                <%-- eDMSKP4 --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=eDMS/KP4" 
                    DataTextField="eDMSKP4Total" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="eDMSKP4Cost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="eDMSKP4Cost"
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />

                <%-- Lotus Traveler --%>
                <asp:HyperLinkField DataNavigateUrlFields="payroll_Company" DataNavigateUrlFormatString="ChargeDetailsSummary.aspx?payroll_Company={0}&ServiceName=Lotus Traveler" 
                    DataTextField="LotusTravelerTotal" HeaderText="No. Of IDs" HeaderStyle-CssClass="info" ControlStyle-CssClass="text" />
                <asp:BoundField DataField="LotusTravelerCost" HeaderText="Jan - Dec (RM)" ReadOnly="True" SortExpression="LotusTravelerCost"
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />

                <%-- Grand Total --%> 
                <%--<asp:BoundField DataField="LotusTravelerCost+eDMSKP4Cost" HeaderText="Jan - Dec (RM)" ReadOnly="True"
                    HeaderStyle-CssClass="info" DataFormatString="{0:N}" />--%>

                <%--<asp:TemplateField >
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server" OnDataBinding="Dg_Source_RowDataBound" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#337AB7" />
    </asp:GridView>
    <i>You are viewing page <%=GridView1.PageIndex + 1%> of <%=GridView1.PageCount%></i>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
        InsertCommand="PUPM_Select_Summary" InsertCommandType="StoredProcedure" SelectCommand="PUPM_Select_Summary" 
        SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="summary" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="summary" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
