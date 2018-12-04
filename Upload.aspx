<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="FLOE.Admin.Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "personal";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });
        });
    </script>

    <%--<script type="text/javascript">
        function HideLabel() {
            document.getElementById('<%= lblLines.ClientID %>').style.display = "none";
            document.getElementById('<%= lblSuccess.ClientID %>').style.display = "none";    
            document.getElementById('<%= lblLinesMonthly.ClientID %>').style.display = "none";
            document.getElementById('<%= lblSuccessMonthly.ClientID %>').style.display = "none";
        }
        setTimeout("HideLabel();", 5000);
    </script>--%>
    
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Upload Excel File</h1>
        </div>
    </div>
    
    <div class="panel-body">
        <div id="Tabs" role="tabpanel">
             <!-- Nav tabs -->
             <ul class="nav nav-tabs nav-justified" role="tablist">
                 <li class="active"><a href="#yearly" aria-controls="yearly" role="tab" data-toggle="tab">Yearly Upload</a></li>
                 <li><a href="#monthly" aria-controls="monthly" role="tab" data-toggle="tab">Monthly Upload</a></li>
             </ul>
             <!-- Tab panes -->
             <div class="tab-content">
                 <div class="tab-pane active" id="yearly" role="tabpanel">
                     <h2>Yearly Excel File Upload</h2><br />
                     <h4>Please select a CSV format file</h4>
                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-default btn-xs dropdown-toggle" DataValueField="Year" 
                         DataTextField="Year" AllowAutomaticLoadOnDemand="true">
                        <asp:ListItem Value="1">Select Year</asp:ListItem>
                     </asp:DropDownList>
                     <br /><br />
                     <asp:DropDownList ID="DropDownList2" runat="server" CssClass="btn btn-default btn-xs dropdown-toggle">
                        <asp:ListItem Value="1">Select the type of account</asp:ListItem>
                     </asp:DropDownList>
                     <br /><br />
                     <asp:FileUpload ID="FileUpload1" runat="server" />
                     <br /><br />
                     <asp:Button ID="btnImport" runat="server" Text="Import" CssClass="btn btn-danger" />
                 </div>
                 <div class="tab-pane" id="monthly" role="tabpanel">
                     <h2>Monthly Excel File Upload</h2><br />
                     <h4>Please select a CSV format file</h4>
                     <asp:DropDownList ID="DropDownList3" runat="server" CssClass="btn btn-default btn-xs dropdown-toggle">
                        <asp:ListItem Value="1">Select Year</asp:ListItem>
                     </asp:DropDownList>
                     <asp:DropDownList ID="DropDownList4" CssClass="btn btn-default btn-xs dropdown-toggle" runat="server">
                         <asp:ListItem Value="1">Select Month</asp:ListItem>
                     </asp:DropDownList>
                     <br /><br />
                     <asp:DropDownList ID="DropDownList5" runat="server" CssClass="btn btn-default btn-xs dropdown-toggle">
                        <asp:ListItem Value="1">Select the type of account</asp:ListItem>
                     </asp:DropDownList>
                     <br /><br />
                     <asp:FileUpload ID="FileUpload2" runat="server" />
                     <br /><br />
                     <asp:Button ID="Button2" runat="server" Text="Import" CssClass="btn btn-danger" />
                 </div>
            </div>
        </div>
        <asp:HiddenField ID="TabName" runat="server" />
    </div>
    <%--<asp:SqlDataSource runat="server" ID="SQLdsMonth" ConnectionString="<%$ConnectionStrings:PUPMconnection %>"
                    SelectCommand="SELECT [Month] FROM [PUPM_Master_Month]"></asp:SqlDataSource>
                    <asp:SqlDataSource runat="server" ID="SQLdsyearr" ConnectionString="<%$ConnectionStrings:PUPMconnection %>"
                    SelectCommand="SELECT DISTINCT [Year] FROM [PUPM_Master_Year]"></asp:SqlDataSource>
                    <asp:SqlDataSource runat="server" ID="SQLdsservicess" ConnectionString="<%$ConnectionStrings:PUPMconnection %>"
                    SelectCommand="SELECT DISTINCT [Service_Name] FROM [PUPM_Master_Service]"></asp:SqlDataSource>--%>
</asp:Content>