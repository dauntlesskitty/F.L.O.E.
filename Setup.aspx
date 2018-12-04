<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="FLOE.Admin.Setup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var currentTab = 0;
        $(function () {
            $("#tabs").tabs({
                select: function (e, i) {
                    currentTab = i.index;
                }
            });
        });
        $("#company").live("click", function () {
            var tabs = $('#tabs').tabs();
            var c = $('#tabs').tabs("length");
            currentTab = currentTab == (c - 1) ? currentTab : (currentTab + 1);
            tabs.tabs('select', currentTab);
            $("#year").show();
            if (currentTab == (c - 1)) {
                $("#company").hide();
            } else {
                $("#company").show();
            }
        });
        $("#year").live("click", function () {
            var tabs = $('#tabs').tabs();
            var c = $('#tabs').tabs("length");
            currentTab = currentTab == 0 ? currentTab : (currentTab - 1);
            tabs.tabs('select', currentTab);
            if (currentTab == 0) {
                $("#company").show();
                $("#year").hide();
            }
            if (currentTab < (c - 1)) {
                $("#company").show();
            }
 
        });
    </script>

    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "personal";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });
        });
    </script>

    <style>
        .gridview {
            width: 100%; 
            word-wrap: break-word;
            table-layout: fixed;
            font-size: 12px;
        }
        .content {
            width: 80px;
        }
    </style>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Master Setup</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>
     <%--Start Menu--%>
    <div class="panel-body">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified">
                <li class="active"><a href="#year" aria-controls="year" role="tab" data-toggle="tab">Year</a></li>
                <li><a href="#company" aria-controls="company" role="tab" data-toggle="tab">Company</a></li>
                <li><a href="#bupic" aria-controls="bupic" role="tab" data-toggle="tab">BUPIC</a></li>
                <li><a href="#charge" aria-controls="charge" role="tab" data-toggle="tab">Charge</a></li>
                <li><a href="#period" aria-controls="period" role="tab" data-toggle="tab">Period</a></li>
                <li><a href="#services" aria-controls="services" role="tab" data-toggle="tab">Services</a></li>
                <li><a href="#userRole" aria-controls="userRole" role="tab" data-toggle="tab">User Role</a></li>
                <li><a href="#verificationYear" aria-controls="verificationYear" role="tab" data-toggle="tab">Verification Year</a></li>
                <li><a href="#allRecords" aria-controls="allRecords" role="tab" data-toggle="tab">All Records</a></li>
            </ul>
    
            <div class="tab-content">
                <%--YEAR VIEW--%>
                <div class="tab-pane fade in active" id="year" role="tabpanel">
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowSorting="true"
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="gridview panel panel-default table table-striped" 
                                OnPageIndexChanging="OnPageIndexChanging" >
                                <Columns>
                                    <%--<asp:Commandfield ButtonType="Button" showinsertbutton="true" showheader="true"/>--%>
                                    <asp:TemplateField HeaderText="Year" SortExpression="Year" HeaderStyle-CssClass="danger" >
                                        <%--To Insert the button can change to image button--%>
                                        <%--     <HeaderTemplate> 
                                        <asp:TextBox runat="server" ID="YearInput"></asp:TextBox> &nbsp;
                                        <asp:LinkButton runat="server" ID="InsertButton" Text="Insert"></asp:LinkButton> 
                                        </HeaderTemplate>--%>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="content" Text='<%# Bind("Year") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_Year" SelectCommandType="StoredProcedure" 
                        UpdateCommandType= "StoredProcedure" UpdateCommand="PUPM_Update_Master_Year"
                        InsertCommandType="StoredProcedure" InsertCommand= "PUPM_Insert_Master_Year">
                        <UpdateParameters>
                            <asp:SessionParameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="Year" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="company" role="tabpanel">
                    <br />
                    <%--COMPANY VIEW--%>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" AllowSorting="True" AllowPaging="True" 
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Company_Code" HeaderText="Code" SortExpression="Company_Code" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Group" HeaderText="Group" SortExpression="Company_Group" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Name" HeaderText="Name" SortExpression="Company_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Division" HeaderText="Division" SortExpression="Company_Division" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Created_By" HeaderText="Created By" SortExpression="Company_Created_By" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Created_Date" HeaderText="Created Date" SortExpression="Company_Created_Date" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Modified_By" HeaderText="Modified By" SortExpression="Company_Modified_By" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Company_Modified_Date" HeaderText="Modified Date" SortExpression="Company_Modified_Date" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs"  HeaderStyle-CssClass="danger" />
                                </Columns>
                                <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#d9534f" />
                            </asp:GridView>
                            <i>You are viewing page <%=GridView2.PageIndex + 1%> of <%=GridView2.PageCount%></i>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_Company" SelectCommandType="StoredProcedure"
                        DeleteCommand="DELETE FROM [PUPM_Master_Company] WHERE ID = @ID" 
                        UpdateCommandType= "StoredProcedure" UpdateCommand="PUPM_Update_Master_Company"
                        InsertCommandType= "StoredProcedure" InsertCommand="PUPM_Insert_Master_Company">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="bupic" role="tabpanel">
                    <br />
                    <%--BUPIC VIEW--%> <%--EDIT NOT WORKING--%>
                     <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" AllowSorting="True" AllowPaging="True" 
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                   <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
                                   <asp:BoundField DataField="BUPIC_Name" HeaderText="Name" SortExpression="BUPIC_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="BPfoPIC_User_Role" HeaderText="User Role" SortExpression="BPfoPIC_User_Role" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="BPfoGroup_ID" HeaderText="Group ID" SortExpression="BPfoGroup_ID" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="BPfoDivision" HeaderText="Division" SortExpression="BPfoDivision" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="BUPIC_ShortName" HeaderText="Short Name" SortExpression="BUPIC_ShortName" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="BUPIC_ShortName1" HeaderText="Short Name 1" SortExpression="BUPIC_ShortName1" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" visible="false" ReadOnly="true"/>
                                   <asp:BoundField DataField="Email_Address" HeaderText="Email Address" SortExpression="Email_Address" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="Created_By" HeaderText="Created By" SortExpression="Created_By" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="Created_Date" HeaderText="Created Date" SortExpression="Created_Date" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="Modified_By" HeaderText="Modified By" SortExpression="Modified_By" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:BoundField DataField="Modified_Date" HeaderText="Modified Date" SortExpression="Modified_Date" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                   <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                                <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#d9534f" />
                            </asp:GridView>
                            <i>You are viewing page <%=GridView3.PageIndex + 1%> of <%=GridView3.PageCount%></i>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_BUPIC" SelectCommandType="StoredProcedure"
                        DeleteCommand="DELETE FROM PUPM_Master_BUPIC WHERE ID = @ID" 
                        UpdateCommandType= "StoredProcedure" UpdateCommand="PUPM_Update_Master_BUPIC"
                        InsertCommandType= "StoredProcedure" InsertCommand="PUPM_Insert_Master_BUPIC">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="charge" role="tabpanel">
                    <br />
                    <%--CHARGE VIEW--%>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource4" AllowSorting="True"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Charge_ID" HeaderText="ID" SortExpression="Charge_ID" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Service_Name" HeaderText="Service Name" SortExpression="Service_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Service_Charge" HeaderText="Service Charge (RM)" SortExpression="Service_Charge" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="CfoStatus_ID" HeaderText="Status ID" SortExpression="CfoStatus_ID" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="CfoStatus_Name" HeaderText="Status Name" SortExpression="CfoStatus_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_Charge" SelectCommandType="StoredProcedure"
                        UpdateCommandType="StoredProcedure" UpdateCommand= "PUPM_Update_Master_Charge"
                        InsertCommandType="StoredProcedure" InsertCommand= "PUPM_Insert_Master_Charge">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="period" role="tabpanel">
                    <br />
                    <%--PERIOD VIEW--%>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource5" AllowSorting="True"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" Visible="false" SortExpression="ID" />
                                    <asp:BoundField DataField="Period_Start" HeaderText="Period Start" SortExpression="Period_Start" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Period_End" HeaderText="Period End" SortExpression="Period_End" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Period_Pupm_Year" HeaderText="Period Year" SortExpression="Period_Pupm_Year" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Period_Auto_Close" HeaderText="Period Auto Close" SortExpression="Period_Auto_Close" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_Period" SelectCommandType="StoredProcedure"
                        UpdateCommandType= "StoredProcedure" UpdateCommand="PUPM_Update_Master_Period"
                        InsertCommandType= "StoredProcedure" InsertCommand="PUPM_Insert_Master_Period">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="services" role="tabpanel">
                    <br />
                    <%--SERVICE VIEW--%>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource6" AllowSorting="True"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Service_ID" HeaderText="ID" SortExpression="Service_ID" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Service_Name" HeaderText="Name" SortExpression="Service_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="SfoStatus" HeaderText="Status" SortExpression="SfoStatus" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_Service" SelectCommandType="StoredProcedure"
                        UpdateCommandType="StoredProcedure" UpdateCommand= "PUPM_UPDATE_Master_Service"
                        InsertCommandType="StoredProcedure" InsertCommand= "PUPM_INSERT_Master_Service">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="userRole" role="tabpanel">
                    <br />
                    <%--USER ROLE VIEW--%>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource7" AllowSorting="True"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID"  Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="User_Type" HeaderText="User Type" SortExpression="User_Type" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs"  HeaderStyle-CssClass="danger" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_UserRole" SelectCommandType="StoredProcedure"
                        UpdateCommandType="StoredProcedure" UpdateCommand="PUPM_Update_Master_UserRole"
                        InsertCommandType="StoredProcedure" InsertCommand="PUPM_Insert_Master_UserRole">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="verificationYear" role="tabpanel">
                    <br />
                    <%--VERIFICATION YEAR VIEW--%>
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource8" AllowSorting="True" 
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID"  Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Verification_Year" HeaderText="Verification Year" SortExpression="Verification_Year" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_VerificationYear" SelectCommandType="StoredProcedure" 
                        UpdateCommandType="StoredProcedure" UpdateCommand= "PUPM_Update_VerificationYear">
                    </asp:SqlDataSource>
                </div>

                <div class="tab-pane fade" id="allRecords" role="tabpanel">
                    <br />
                    <%--ALL RECORDS--%>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" AllowSorting="True" AllowPaging="True"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="gridview panel panel-default table table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Name_IC" HeaderText="Name IC" SortExpression="Name_IC" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Division_Matrix" HeaderText="Division Matrix" SortExpression="Division_Matrix" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="ID_Name" HeaderText="ID Name" SortExpression="ID_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Short_Name" HeaderText="Short Name" SortExpression="Short_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Citrix_Services" HeaderText="Citrix Services" SortExpression="Citrix_Services" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="Payroll_Company" HeaderText="Payroll Company" SortExpression="Payroll_Company" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="MfoService_Name" HeaderText="Service Name" SortExpression="MfoService_Name" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="Bill To Company" SortExpression="MfoCompany_Bill_To" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:BoundField DataField="MfoStatus_IDQ1Q2" HeaderText="Status IDQ1Q2" SortExpression="MfoStatus_IDQ1Q2" ControlStyle-CssClass="content" HeaderStyle-CssClass="danger" />
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger btn-xs" HeaderStyle-CssClass="danger" />
                                </Columns>
                                <pagersettings mode="NumericFirstLast" firstpagetext="First" lastpagetext="Last" pagebuttoncount="10" /> 
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" Font-Bold="True" ForeColor="#d9534f" />
                            </asp:GridView>
                            <i>You are viewing page <%=GridView9.PageIndex + 1%> of <%=GridView9.PageCount%></i>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" 
                        SelectCommand="PUPM_Select_Master_AllRecords" SelectCommandType="StoredProcedure"
                        UpdateCommandType="StoredProcedure" UpdateCommand= "PUPM_Update_Master_AllRecords"
                        InsertCommandType="StoredProcedure" InsertCommand= "PUPM_Insert_Master_AllRecords">
                        <InsertParameters>
                            <asp:Parameter Name="Year" Type="String" />
                            <asp:Parameter Name="Name_IC" Type="String" />
                            <asp:Parameter Name="Division_Matrix" Type="String" />
                            <asp:Parameter Name="ID_Name" Type="String" />
                            <asp:Parameter Name="Short_Name" Type="String" />
                            <asp:Parameter Name="Citrix_Services" Type="String" />
                            <asp:Parameter Name="Payroll_Company" Type="String" />
                            <asp:Parameter Name="MfoService_Name" Type="String" />
                            <asp:Parameter Name="MfoCompany_Bill_To" Type="String" />
                            <asp:Parameter Name="MfoStatus_IDQ1Q2" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter Name="Year" Type="String" DefaultValue="2018" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Year" Type="String" />
                            <asp:Parameter Name="ID" Type="Int64" />
                            <asp:Parameter Name="Division_Matrix" Type="String" />
                            <asp:Parameter Name="Payroll_Company" Type="String" />
                            <asp:Parameter Name="Name_IC" Type="String" />
                            <asp:Parameter Name="ID_Name" Type="String" />
                            <asp:Parameter Name="Short_Name" Type="String" />
                            <asp:Parameter Name="MfoService_Name" Type="String" />
                            <asp:Parameter Name="Citrix_Services" Type="String" />
                            <asp:Parameter Name="MfoCompany_Bill_To" Type="String" />
                            <asp:Parameter Name="MfoStatus_IDQ1Q2" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="TabName" runat="server" />
    </div>
</asp:Content>