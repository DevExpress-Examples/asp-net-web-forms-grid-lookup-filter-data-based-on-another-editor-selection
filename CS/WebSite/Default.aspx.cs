using System;
using DevExpress.Web;
using DevExpress.Data.Filtering;

public partial class _Default: System.Web.UI.Page {
    protected void glProducts_Init(object sender, EventArgs e) {
        ASPxGridLookup gridLookup = sender as ASPxGridLookup;
        gridLookup.GridView.CustomCallback += new ASPxGridViewCustomCallbackEventHandler(gridView_CustomCallback);
        if (Session["FilterExpression"] != null) {
            gridLookup.GridView.DataSource = adsProducts;
            adsProducts.FilterExpression = Session["FilterExpression"].ToString();
        }
    }

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
}