<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateLanguagePack.ascx.cs"
    Inherits="Localization_CreateLanguagePack" %>

<script type="text/javascript">
    //<![CDATA[   
    $(document).ready(function() {
   $("#fuck").hide();
        if ($('.cssClassLanguagePackCreaterModule ul li input').length < 2) {
            $('#chkSelectAll').css("display", "none");
            $('#<%=lblSelectAll.ClientID%>').css("display", "none");
        }
        $('#chkSelectAll').bind("click", function() {
            if ($(this).prop("checked") == true) {
                CheckAll();
            }
            else {
                UnCheckAll();
            }
        });
    });
    function CheckAll() {
        var checks = $('.cssClassLanguagePackCreaterModule ul li input');
        $.each(checks, function(index, item) {
            $(this).prop("checked", true);
        });
    }
    function UnCheckAll() {
        var checks = $('.cssClassLanguagePackCreaterModule ul li input');
        $.each(checks, function(index, item) {
            $(this).prop("checked", false);
        });
    }
    //]]>	
        
</script>

<h1>
    <asp:Label ID="lblLanguagePackCreator" runat="server" Text="Language Pack Creator"></asp:Label>
</h1>
<div class="sfFormwrapper">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="130">
                <asp:Label runat="server" ID="lblResoucreLocale" CssClass="sfFormlabel" Text="Resource Locale"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlResourceLocale" CssClass="sfListmenu" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlResourceLocale_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblResoucrePackType" CssClass="sfFormlabel" Text="Resource Pack Type"></asp:Label>
            </td>
            <td class="sfRadiobutton">
                <asp:RadioButtonList ID="rbResourcePackType" RepeatDirection="Horizontal" runat="server"
                    AutoPostBack="True" OnSelectedIndexChanged="rbResourcePackType_SelectedIndexChanged">
                    <asp:ListItem Text="Core" Selected="True" Value="Core"></asp:ListItem>
                    <asp:ListItem Text="Module" Value="Module"></asp:ListItem>
                    <asp:ListItem Text="Full" Value="Full"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="togglingTr" runat="server">          
            <td>
                &nbsp;
            </td>
            <td>
                <div id="divModuleDetails" runat="server" class="cssClassLanguagePackCreaterModule">
                    <p class="sfNote">
                        Please select the modules to include in the language pack</p>
                    <input type="checkbox" id="chkSelectAll" />
                    <asp:Label ID="lblSelectAll" runat="server" CssClass="sfFormlabel" Text="Select All"></asp:Label>
                    <ul>
                        <asp:Repeater ID="rptrModules" runat="server">
                            <ItemTemplate>
                                <li>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                    <asp:Label ID="lblModuleName" runat="server" Text='<%# Eval("ModuleName") %>' ></asp:Label>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblResourcePackName" CssClass="sfFormlabel" Text="Resource Pack Name"></asp:Label>
            </td>
            <td>
                ResourcePack
                <asp:TextBox ID="txtResourcePackName" runat="server" Width="120px" Text="Core" CssClass="sfInputbox"></asp:TextBox>
                .&lt;version&gt;.&lt;locale&gt;.zip
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblDownLoadPathLabel" CssClass="sfFormlabel" Text="Download Package:"></asp:Label>
            </td>
            <td>
                <asp:LinkButton ID="lnkBtnDownloadPackage" runat="server" OnClick="lnkBtnDownloadPackage_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
</div>
<div class="sfButtonwrapper">
<label class="sfLocale icon-download-package sfBtn">Create
    <asp:Button ID="imbCreatePackage" runat="server" ImageUrl="~/Administrator/Templates/Default/images/btncreatepackage.png"
        OnClick="imbCreatePackage_Click" /></label>
   <label class="sfLocale icon-close sfBtn">Cancel
    <asp:Button ID="imbCancel" runat="server" OnClick="imbCancel_Click" ImageUrl="~/Administrator/Templates/Default/images/btncancel.png" />
        </label>
    
</div>
