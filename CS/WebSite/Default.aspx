<%-- BeginRegion Page Settings --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Editors_Validation_HowToRaiseValidation" %>
<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>How to raise validation</title>
<%-- BeginRegion Style --%>
    <style type="text/css">
        body {
            font-family: Tahoma;
            font-size: 9pt;
            color: #111;
        }
        .list {
            list-style: none;
        }
        .list li {
            margin-top: 15px;
        }
        .list li .separator {
            margin-top: 15px;
            height: 1px;
            border-bottom: 1px dashed #ccc;
        }
    </style>
<%-- EndRegion --%>
</head>
<body>
    <form id="form1" runat="server">
        
        <ul class="list">
            <li>
                <strong>1. Validation is automatically raised on changing a value:</strong>
                <br /><br />
                <table>
                    <tr>
                        <td>
                            Remove text and focus
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="tbTextBox1" runat="server" Width="170px" Text="Some value">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" ErrorText="Field is required." />
                                </ValidationSettings>
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Change the selected item
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" SelectedIndex="1">
                                <Items>
                                    <dxe:ListEditItem Value="" Text="(Empty)" />
                                    <dxe:ListEditItem Value="Some value" Text="Some value" />
                                </Items>
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" ErrorText="Select not empty value." />
                                </ValidationSettings>
                            </dxe:ASPxComboBox>
                        </td>
                    </tr>
                </table>
                <div class="separator"></div>
            </li>
            <li>
<!--region #ClientEditValidate-->
                <strong>2. Validating a single editor via a script:</strong>
                <br /><br />
                <table>
                    <tr>
                        <td>
                            <input type="button" value="Validate" onclick="aspxGetControlCollection().Get('tbTextBox2').Validate();" style="width: 127px;" />
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="tbTextBox2" runat="server" ClientInstanceName="tbTextBox2" Width="170px">
                                <ValidationSettings validateonleave="False">
                                    <RequiredField IsRequired="True" ErrorText="Field is required." />
                                </ValidationSettings>
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                </table>
<!--endregion #ClientEditValidate-->
                <div class="separator"></div>
            </li>
            <li>
                <strong>3. Validating the editors' group via a script:</strong>
                <br /><br /><br />
<!--region #ValidateGroup-->
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="200px" View="GroupBox" HeaderText="ValidationGroup = 'MyGroup'">
                    <PanelCollection>
                        <dxrp:PanelContent ID="PanelContent1" runat="server">  
                            <dxe:ASPxTextBox ID="tbTextBox3" runat="server" Width="170px" Style="margin-bottom: 4px;">
                                <ValidationSettings ValidationGroup="MyGroup" ErrorText="Field is required." validateonleave="False">
                                    <RequiredField IsRequired="True" ErrorText="" />
                                </ValidationSettings>
                            </dxe:ASPxTextBox>
                            <dxe:ASPxTextBox ID="tbTextBox4" runat="server" Width="170px">
                                <ValidationSettings ValidationGroup="MyGroup" ErrorText="Field is required." validateonleave="False">
                                    <RequiredField IsRequired="True" ErrorText="" />
                                </ValidationSettings>
                            </dxe:ASPxTextBox>
                            <br />
                            <input type="button" value="Validate Group" onclick="ASPxClientEdit.ValidateGroup('MyGroup');" />
                        </dxrp:PanelContent>
                    </PanelCollection>
                    <HeaderStyle Font-Size="9pt" />
                </dxrp:ASPxRoundPanel>
<!--endregion #ValidateGroup-->
                <div class="separator"></div>
            </li>
            <li>
                <strong>
                    4. If an editor has AutoPostBack="True" and CausesValidation="True", then, on changing 
                        its value, validation will be raised for all editors from its ValidationGroup:
                </strong>
                <br /><br />
<!--region #CausesValidation-->
                <dxe:ASPxComboBox ID="cbComboBox2" runat="server" AutoPostBack="True">
                    <Items>
                        <dxe:ListEditItem Value="" Text="(Empty)" />
                        <dxe:ListEditItem Value="Some value" Text="Some value" />
                    </Items>                    
                    <ValidationSettings CausesValidation="True" ValidationGroup="CausesValidationDemoGroup">
                        <RequiredField IsRequired="True" ErrorText="Select not empty value." />
                    </ValidationSettings>
                </dxe:ASPxComboBox>
                <br />
                <dxe:ASPxComboBox ID="cbComboBox3" runat="server" AutoPostBack="True">
                    <Items>
                        <dxe:ListEditItem Value="" Text="(Empty)" />
                        <dxe:ListEditItem Value="Some value" Text="Some value" />
                    </Items>                    
                    <ValidationSettings CausesValidation="True" ValidationGroup="CausesValidationDemoGroup">
                        <RequiredField IsRequired="True" ErrorText="Select not empty value." />
                    </ValidationSettings>
                </dxe:ASPxComboBox>
                <br />
                <dxe:ASPxComboBox ID="ASPxComboBox2" runat="server" AutoPostBack="True">
                    <Items>
                        <dxe:ListEditItem Value="" Text="(Empty)" />
                        <dxe:ListEditItem Value="Some value" Text="Some value" />
                    </Items>                    
                    <ValidationSettings CausesValidation="True" ValidationGroup="CausesValidationDemoGroup">
                        <RequiredField IsRequired="True" ErrorText="Select not empty value." />
                    </ValidationSettings>
                </dxe:ASPxComboBox>
<!--endregion #CausesValidation-->
                <div class="separator"></div>
            </li>
            <li>
                <strong>5. Validating all editors on the page via a script:</strong>
                <br /><br />
                <input type="button" value="Reset All Values" onclick="ASPxClientEdit.ClearEditorsInContainer(null);" />
                <input type="button" value="Validate All Editors" onclick="ASPxClientEdit.ValidateEditorsInContainer(null);" />
            </li>
        </ul>
    </form>
</body>
</html>
