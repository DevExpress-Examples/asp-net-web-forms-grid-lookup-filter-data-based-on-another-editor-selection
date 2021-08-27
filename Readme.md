<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128530847/13.1.10%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3959)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridLookup - How to bind a lookup based on multiple selection of another lookup 
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e3959/)**
<!-- run online end -->


<p>This example demonstrates how to implement two cascaded<strong> ASPxGridLookup </strong>controls:<br />
To implement it, perform the following steps:</p><p>1) Handle the server-side<strong> ASPxGridLookup.Init</strong> event of a "detail" lookup and subscribe to the <strong>CustomCallback</strong> event of a nested <strong>ASPxGridView</strong> object;<br />
2) Handle the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsScriptsASPxClientEdit_ValueChangedtopic"><u>ASPxClientGridLookup.ValueChanged</u></a> event of a "master" lookup;<br />
3) Perform a custom callback of the "detail"<strong> ASPxGridLookup</strong> via the <strong>ASPxClientGridLookup.GetGridView().PerformCallBack</strong> method;<br />
4) Handle the "detail" <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CustomCallbacktopic"><u>ASPxGridView.CustomCallback</u></a> event and define a filter expression for a "detail" datasource based on selected values of the "master" lookup;<br />
5) Save a modified select command to the session to load it when the "detail" <strong>ASPxGridLookup/ASPxGridView</strong> is initialized after a callback.</p>

<br/>


