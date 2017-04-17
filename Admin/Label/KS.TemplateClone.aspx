<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_TemplateClone" Codebehind="KS.TemplateClone.aspx.cs" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>模板克隆</title>
    <link href="../../admin/images/style.CSS" rel="stylesheet" type="text/css" />
    <script src="../../ks_inc/Jquery.js" type="text/javascript"></script>
    <script src="../../KS_Inc/Kesion.Common.js" type="text/javascript"></script>
    <script type="text/javascript">
    function CheckForm()
    {
     if (!IsExt(document.myform.TemplateFile.value,'htm')&&!IsExt(document.myform.TemplateFile.value,'html')&&!IsExt(document.myform.TemplateFile.value,'shtml')&&!IsExt(document.myform.TemplateFile.value,'shtm'))
	   { 
	   alert('模板文件的扩展名必须是.html,.htm,.shtml,.shtm之一');
	   document.myform.TemplateFile.focus();
	   return false;
	 }
    }
    </script>
</head>
<body class="righttd" scroll="auto">
    <form id="myform" runat="server">
    	<br />
       原模板名称：<%=CurrPath+fileName %><div class="hr_line"></div>
       模板名称：<%=CurrPath %><asp:TextBox CssClass="textbox" ID="TemplateFile" runat="server" Width="280px"></asp:TextBox> <font color=red>*</font>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TemplateFile"
            ErrorMessage="请输入文件名称"></asp:RequiredFieldValidator><br />
        <div class="pop-button">
        <asp:Button ID="Button1" runat="server" AccessKey="A" CssClass="button" OnClick="Button1_Click"
            Text="确定克隆(A)" />
            <input type="button" class="button" value="关闭取消(C)" accesskey="C" onclick="parent.isreload = false;parent.box.close();" />
            </div>
            <script type="text/javascript">
		 showtips('<span class="state"><strong>说明：</strong><br /></span>请与扩展名.html,.htm,.shtml,.shtm其中之一为扩展名，如article.html。<br />');
  </script>
    </form>
</body>
</html>
