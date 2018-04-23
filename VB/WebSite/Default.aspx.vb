Imports System
Imports DevExpress.Web.ASPxGridLookup
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Data.Filtering

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub glProducts_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridLookup As ASPxGridLookup = TryCast(sender, ASPxGridLookup)
		AddHandler gridLookup.GridView.CustomCallback, AddressOf gridView_CustomCallback
		If Session("FilterExpression") IsNot Nothing Then
			gridLookup.GridView.DataSource = adsProducts
			adsProducts.FilterExpression = Session("FilterExpression").ToString()
		End If
	End Sub

	Public Sub gridView_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
		If e.Parameters <> "ValueChanged" Then
			Return
		End If

		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
		Dim selectedValues = glCategories.GridView.GetSelectedFieldValues(glCategories.KeyFieldName)
		If selectedValues.Count = 0 Then
			selectedValues.Add(-1)
		End If
		Dim selectionCriteria As CriteriaOperator = New InOperator(glCategories.KeyFieldName, selectedValues)
		adsProducts.FilterExpression = (GroupOperator.Combine(GroupOperatorType.And, selectionCriteria)).ToString()
		Session("FilterExpression") = adsProducts.FilterExpression
		grid.DataSource = adsProducts
		grid.DataBind()
	End Sub
End Class