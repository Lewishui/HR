<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_TemplateAdd" Codebehind="KS.TemplateAdd.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>�ޱ���ҳ</title>
    <link href="../../admin/images/style.CSS" rel="stylesheet" type="text/css" />
    <script src="../../ks_inc/Jquery.js" type="text/javascript"></script>
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
    <script type="text/javascript">
    function CheckForm()
    {
     if (!IsExt(document.myform.TemplateFile.value,'htm')&&!IsExt(document.myform.TemplateFile.value,'html')&&!IsExt(document.myform.TemplateFile.value,'shtml')&&!IsExt(document.myform.TemplateFile.value,'shtm'))
	   { 
	   alert('ģ���ļ�����չ��������.html,.htm,.shtml,.shtm֮һ');
	   document.myform.TemplateFile.focus();
	   return false;
	 }
    }
    </script>
</head>
<body class="righttd" scroll="auto">
    <form id="myform" runat="server">
    <div style="text-align:center">
        <br />
        &nbsp; &nbsp; <strong>�ļ�����</strong><%=CurrPath %><asp:TextBox CssClass="textbox" ID="TemplateFile" runat="server" Width="280px">Untitled.html</asp:TextBox> <font color=red>*</font>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TemplateFile"
            ErrorMessage="�������ļ�����"></asp:RequiredFieldValidator>
     </div>   
        <div class="pop-button">
        <asp:Button ID="Button1" runat="server" AccessKey="A" CssClass="button" OnClick="Button1_Click"
            Text="ȷ������(A)" />
            <input type="button" class="button" value="�ر�ȡ��(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
            </div>
            <script type="text/javascript">
		 showtips('<span class="state"><strong>˵����</strong><br /></span>������չ��.html,.htm,.shtml,.shtm����֮һΪ��չ������article.html��<br />');
  </script>
    </form>
</body>
</html>
