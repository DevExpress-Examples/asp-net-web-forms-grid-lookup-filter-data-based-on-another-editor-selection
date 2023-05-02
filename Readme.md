# Grid Lookup for ASP.NET Web Forms - How to filter an editor's data based on selected values of another editor
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e3959/)**
<!-- run online end -->

This example demonstrates how to create a filter expression based on an editor's selected values and use this expression to filter another editor's data.

![Filter Grid Lookup Control](filterGridLookup.gif)

## Overview

Create two grid lookup editors and populate them with records. Handle the secondary editor's server-side `Init` event and add a [CustomCallback](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomCallback) event handler.

```cs
protected void glProducts_Init(object sender, EventArgs e) {
    ASPxGridLookup gridLookup = sender as ASPxGridLookup;
    gridLookup.GridView.CustomCallback += new ASPxGridViewCustomCallbackEventHandler(gridView_CustomCallback);
    if (Session["FilterExpression"] != null) {
        gridLookup.GridView.DataSource = adsProducts;
        adsProducts.FilterExpression = Session["FilterExpression"].ToString();
    }
}
```

To send a callback to the server when the primary editor's selection changes, handle the editor's client-side [ValueChanged](https://docs.devexpress.com/AspNet/js-ASPxClientEdit.ValueChanged) event.

```aspx
<dx:ASPxGridLookup ID="glCategories" runat="server" ClientInstanceName="glCategories" SelectionMode="Multiple" ...>
    <!-- ... --
    <ClientSideEvents ValueChanged="function(s, e) {
        var grid = glProducts.GetGridView();
        grid.PerformCallback('ValueChanged');
    }" />
</dx:ASPxGridLookup>
```

Handle the secondary editor's [CustomCallback](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomCallback) event. In the handler, define a filter expression to bind the secondary editor to a data source based on the selected values in the primary editor.

```cs
public void gridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
    if (e.Parameters != "ValueChanged") return;

    ASPxGridView grid = sender as ASPxGridView;
    var selectedValues = glCategories.GridView.GetSelectedFieldValues(glCategories.KeyFieldName);
    if (selectedValues.Count == 0)
        selectedValues.Add(-1);
    CriteriaOperator selectionCriteria = new InOperator(glCategories.KeyFieldName, selectedValues);
    adsProducts.FilterExpression = (GroupOperator.Combine(GroupOperatorType.And, selectionCriteria)).ToString();
    Session["FilterExpression"] = adsProducts.FilterExpression;
    grid.DataSource = adsProducts;
    grid.DataBind();
}
```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))

## Documentation

* [Grid Lookup Selection Modes](https://docs.devexpress.com/AspNet/9075/components/grid-view/concepts/aspxgridlookup/selection-modes)

## More Examples

* [Grid View for ASP.NET Web Forms - Use a grid lookup control in multiple selection mode as a grid view editor](https://github.com/DevExpress-Examples/how-to-use-aspxgridlookup-in-multiple-selection-mode-as-the-aspxgridview-editor-e3981)
