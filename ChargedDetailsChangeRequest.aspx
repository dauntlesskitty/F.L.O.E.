<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChargedDetailsChangeRequest.aspx.cs" Inherits="FLOE.Admin.ChargedDetailsChangeRequest" %>
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
            <h1 class="page-header">Change Request List > Charge Details</h1>
        </div>
        <!-- /.col-lg-12 -->  
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="gridview panel panel-default table table-striped" AllowSorting="True">
        <Columns>

            <asp:BoundField DataField="ID_Name" HeaderText="Name" HeaderStyle-CssClass="warning" SortExpression="ID_Name" />
            <asp:TemplateField HeaderText="ID Charged" SortExpression="ID_Charged" HeaderStyle-Width="85px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:CheckBox ID="IDCharged" runat="server"></asp:CheckBox>
                </ItemTemplate>
            <HeaderStyle Width="85px"></HeaderStyle><ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="MfoService_Name" HeaderText="Service Name" HeaderStyle-CssClass="warning" SortExpression="MfoService_Name" />
            <asp:BoundField DataField="MfoCompany_Bill_To" HeaderText="Company To Bill" HeaderStyle-CssClass="warning" SortExpression="MfoCompany_Bill_To" />
            <asp:BoundField DataField="Justification" HeaderText="Justification" HeaderStyle-CssClass="warning" SortExpression="Justification" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" HeaderStyle-CssClass="warning" SortExpression="Remarks" />
             
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false"/>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" Visible="false" />
            <asp:BoundField DataField="Name_IC" HeaderText="Name_IC" SortExpression="Name_IC" Visible="false" />
            <asp:BoundField DataField="Division_Matrix" HeaderText="Division_Matrix" SortExpression="Division_Matrix" Visible="false" />
            <asp:BoundField DataField="Short_Name" HeaderText="Short_Name" SortExpression="Short_Name" Visible="false"/>
            <asp:BoundField DataField="Citrix_Services" HeaderText="Citrix_Services" SortExpression="Citrix_Services" Visible="false"/>
            <asp:BoundField DataField="Payroll_Company" HeaderText="Payroll_Company" SortExpression="Payroll_Company" Visible="false"/>
            <asp:BoundField DataField="Reference_No" HeaderText="Reference_No" SortExpression="Reference_No" Visible="false" />
            <asp:BoundField DataField="ID1" HeaderText="ID1" InsertVisible="False" ReadOnly="True" SortExpression="ID1" Visible="false" />
            <asp:BoundField DataField="Batch_No" HeaderText="Batch_No" SortExpression="Batch_No" Visible="false" />
            <asp:BoundField DataField="Year1" HeaderText="Year1" SortExpression="Year1" Visible="false" />
            <asp:BoundField DataField="Name_IC1" HeaderText="Name_IC1" SortExpression="Name_IC1" Visible="false"/>
            <asp:BoundField DataField="Division_Matrix1" HeaderText="Division_Matrix1" SortExpression="Division_Matrix1" Visible="false"/>
            <asp:BoundField DataField="ID_Name1" HeaderText="ID_Name1" SortExpression="ID_Name1" Visible="false"/>
            <asp:BoundField DataField="Short_Name1" HeaderText="Short_Name1" SortExpression="Short_Name1" Visible="false"/>
            <asp:BoundField DataField="Citrix_Services1" HeaderText="Citrix_Services1" SortExpression="Citrix_Services1" Visible="false"/>
            <asp:BoundField DataField="Payroll_Company1" HeaderText="Payroll_Company1" SortExpression="Payroll_Company1" Visible="false"/>
            <asp:BoundField DataField="MfoService_Name1" HeaderText="MfoService_Name1" SortExpression="MfoService_Name1" Visible="false"/>
            <asp:BoundField DataField="MfoCompany_Bill_To1" HeaderText="MfoCompany_Bill_To1" SortExpression="MfoCompany_Bill_To1" Visible="false"/>
            <asp:BoundField DataField="MfoBU_PIC" HeaderText="MfoBU_PIC" SortExpression="MfoBU_PIC" Visible="false"/>
            <asp:BoundField DataField="MfoCharge" HeaderText="MfoCharge" SortExpression="MfoCharge" Visible="false"/>
            <asp:BoundField DataField="MfoStatus_IDQ1Q2" HeaderText="MfoStatus_IDQ1Q2" SortExpression="MfoStatus_IDQ1Q2" Visible="false"/>
            <asp:BoundField DataField="MfoStatus_IDQ3Q4" HeaderText="MfoStatus_IDQ3Q4" SortExpression="MfoStatus_IDQ3Q4" Visible="false"/>
            <asp:BoundField DataField="MfoStatus_Q1Q2" HeaderText="MfoStatus_Q1Q2" SortExpression="MfoStatus_Q1Q2" Visible="false"/>
            <asp:CheckBoxField DataField="Selected" HeaderText="Selected" SortExpression="Selected" Visible="false" />
            <asp:BoundField DataField="Justification1" HeaderText="Justification1" SortExpression="Justification1" Visible="false"/>
            <asp:BoundField DataField="Billing_No" HeaderText="Billing_No" SortExpression="Billing_No" Visible="false"/>
            <asp:BoundField DataField="Main_Created_By" HeaderText="Main_Created_By" SortExpression="Main_Created_By" Visible="false"/>
            <asp:BoundField DataField="Main_Created_Date" HeaderText="Main_Created_Date" SortExpression="Main_Created_Date" Visible="false"/>
            <asp:BoundField DataField="Main_Modified_By" HeaderText="Main_Modified_By" SortExpression="Main_Modified_By" Visible="false"/>
            <asp:BoundField DataField="Main_Modified_Date" HeaderText="Main_Modified_Date" SortExpression="Main_Modified_Date" Visible="false"/>
            <asp:BoundField DataField="Reference_No1" HeaderText="Reference_No1" SortExpression="Reference_No1" Visible="false"/>
            <asp:BoundField DataField="ID2" HeaderText="ID2" InsertVisible="False" ReadOnly="True" SortExpression="ID2" Visible="false"/>
            <asp:BoundField DataField="Verification_Year" HeaderText="Verification_Year" SortExpression="Verification_Year" Visible="false"/>
            <asp:BoundField DataField="Quaterly_Verification" HeaderText="Quaterly_Verification" SortExpression="Quaterly_Verification" Visible="false"/>
            <asp:BoundField DataField="VerificationYear_Created_By" HeaderText="VerificationYear_Created_By" SortExpression="VerificationYear_Created_By" Visible="false"/>
            <asp:BoundField DataField="VerificationYear_Created_Date" HeaderText="VerificationYear_Created_Date" SortExpression="VerificationYear_Created_Date" Visible="false"/>
            <asp:BoundField DataField="VerificationYear_Modified_By" HeaderText="VerificationYear_Modified_By" SortExpression="VerificationYear_Modified_By" Visible="false"/>
            <asp:BoundField DataField="VerificationYear_Modified_Date" HeaderText="VerificationYear_Modified_Date" SortExpression="VerificationYear_Modified_Date" Visible="false"/>
            <asp:BoundField DataField="LDATE" HeaderText="LDATE" ReadOnly="True" SortExpression="LDATE" Visible="false"/>
            <asp:BoundField DataField="LfoRefNo" HeaderText="LfoRefNo" SortExpression="LfoRefNo" Visible="false"/>
        </Columns>
    </asp:GridView>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDM_PUPMConnectionString1 %>" SelectCommand="PUPM_Select_BUFeedback" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Payroll_Company" QueryStringField="Payroll_Company" Type="String" />
            <asp:QueryStringParameter Direction="InputOutput" Name="MfoService_Name" QueryStringField="ServiceName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
