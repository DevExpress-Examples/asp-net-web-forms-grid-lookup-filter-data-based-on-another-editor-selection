<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<dx:ASPxGridLookup ID="glCategories" runat="server" IncrementalFilteringMode="Contains"
		AutoGenerateColumns="False" DataSourceID="adsCategories" KeyFieldName="CategoryID"
		ClientInstanceName="glCategories" SelectionMode="Multiple">
		<GridViewProperties>
			<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True"></SettingsBehavior>
		</GridViewProperties>
		<ClientSideEvents ValueChanged="function(s, e) {
		   var grid = glProducts.GetGridView();
			grid.PerformCallback('ValueChanged');
		}" />
		<Columns>
			<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
			</dx:GridViewCommandColumn>
			<dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
				<EditFormSettings Visible="False" />
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
			</dx:GridViewDataTextColumn>
		</Columns>
	</dx:ASPxGridLookup>
	<br />
	<dx:ASPxGridLookup runat="server" ID="glProducts" KeyFieldName="ProductID" AutoGenerateColumns="False"
		ClientInstanceName="glProducts" OnInit="glProducts_Init">
		<GridViewProperties>
			<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
		</GridViewProperties>
		<Columns>
			<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
				<EditFormSettings Visible="False"></EditFormSettings>
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="6">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="9">
			</dx:GridViewDataCheckColumn>
		</Columns>
	</dx:ASPxGridLookup>
	<asp:AccessDataSource ID="adsCategories" runat="server" DataFile="~/App_Data/Northwind.mdb"
		SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
	<asp:AccessDataSource ID="adsProducts" runat="server" DataFile="~/App_Data/Northwind.mdb"
		SelectCommand="SELECT * FROM [Products] "></asp:AccessDataSource>
	</form>
</body>
</html>