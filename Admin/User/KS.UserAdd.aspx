<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_UserAdd" Title="Untitled Page" CodeBehind="KS.UserAdd.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="AddPanel" runat="server" Width="100%">

      <div id="manage_top" class="toptitle menu_top_fixed">
      	  <ul class="titleTab">
      		<li>����������</li>
            <li class="curr"><a href="KS.UserAdd.Aspx">�����û�</a></li>
            <li><a href="KS.UserImport.Aspx">�ⲿ����Դ��������</a></li>
          </ul>  
       </div>
        <div class="menu_top_fixed_height"></div> 
        <div class="content-area">
        	<div class="tab-page" id="AddUserPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AddUserPanel"), 1)
         </script>
             <style>
			.reg_box_l{ width:100%;}
			.reg_box_l li{ overflow:hidden; clear:both; border-bottom:#EBF0F3 solid 1px; position:relative}
			.reg_box_l li .title{padding: 5px; float:left; width:84px; position:absolute; left:0; top:50%; margin-top:-17px; text-align:right;line-height: 24px;font-size: 12px;color: #555; }
			.reg_box_l li .rdiv{ float:left; padding:10px; padding-left:123px; text-align:left}
			.reg_box_l li .rdiv td{ padding:0 10px !important;}
			.reg_box_l li .d_default{ color:#b0b9bf; padding:10px; margin-top:5px; float:left;}
			.reg_box_l li .rdiv .textbox{ float:left;}
			.reg_box_l li .rdiv span{ float:left !important}
			</style>
            <script>
                $(document).ready(function(){
                    showAgent();
                });
                function showAgent(){
                    var groupid=$("#GroupID").val();
                    if (groupid!=-1&&groupid!=1){
                        $("#tjr").show();
                    }else{
                        $("#tjr").hide();
                    }
                <%if (MyCache.GetShopCommonConfig(59).Equals("0")){%>
                    $("#GroupID option").each(function(){
                        if (parseInt($(this).val())<0){
                            $(this).remove();
                        }
                    });
                    <%}else if (userid==0){%>
                    $("#GroupID option").each(function(){
                        if (parseInt($(this).val())<-1 && parseInt($(this).val())!=-4){
                            $(this).remove();
                        }
                    });
                    <%}%>
                }
                function CheckForm(){
                    if ($("#<%=UserName.ClientID%>").val()==''){
                        KesionJS.Alert('�������û�����!','$("#<%=UserName.ClientID%>").focus();');
                        return false;
                    }
                    if ($("#<%=PassWord.ClientID%>").val()==''){
                       // KesionJS.Alert('�������¼����!','$("#<%=PassWord.ClientID%>").focus();');
                       // return false;
                    }
                    if ($("#<%=TxtMobile.ClientID%>").val()!=''){
                        if (ismobile($("#<%=TxtMobile.ClientID%>").val())==false){
                            KesionJS.Alert('�ֻ������ʽ����ȷ!','$("#<%=TxtMobile.ClientID%>").focus();');
                            return false;
                        }
                    }
                    <%=sb.ToString()%>
                }
            </script>
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>�û����ͣ�</strong></td>
              <td class="righttd">
              <span id="groupidarea" runat="server"></span>
              </td>
          </tr>
          <tr id="tjr">
            <td class="lefttd" height="30" align="right" style="width: 84px"><b>�� �� �ˣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAgent" runat="server" Width="268px"></asp:TextBox>
                <span class="tips">������Ƽ��ˣ�����д�Ƽ��˵��û�����</span>
               </td>
          </tr>

          <tr>
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>�������ţ�</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpDepartID" runat="server">
                 <asp:ListItem Value="0">--�������κβ���--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr id="AskRank" runat="server">
             <td align="right" class="lefttd" height="30" style="width: 84px"><strong>�ʰɵȼ���</strong></td>
             <td class="righttd">
                &nbsp;<asp:DropDownList ID="DrpAskRankId" runat="server">
                 <asp:ListItem Value="0">--�������ʰɵȼ�--</asp:ListItem>
                </asp:DropDownList>
             </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 84px"><b>��Ա���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="UserName" runat="server" Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                    ErrorMessage="����д�û���¼����!" Display="Dynamic"></asp:RequiredFieldValidator>
                   <span class="tips">����ʹ��Ӣ�����ơ�</span> 
                    </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��¼���룺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="PassWord" runat="server" TextMode="password" Width="268px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="ValidatorPass" runat="server" ControlToValidate="PassWord"
                      ErrorMessage="�������¼����!" Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:Label ID="passtips" CssClass="tips" runat="server"></asp:Label>
                     <span class="tips">�������ò�����6λ��</span>  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>�������䣺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Email" runat="server" Width="268px"></asp:TextBox>
                 
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                      Display="Dynamic" ErrorMessage="���������ʽ����ȷ!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <span class="tips">�磺kesioncms@hotmail.com</span>
                      </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>�ֻ����룺</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="168px"></asp:TextBox>
                <strong>�����ֻ���������֤��</strong><asp:RadioButtonList ID="RdbIsMobileRZ" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                   <asp:ListItem Value="0" Selected>��</asp:ListItem>
                   <asp:ListItem Value="1">��</asp:ListItem>
                  </asp:RadioButtonList> </td>
          </tr>
         
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��ʾ���⣺</strong></td>
              <td class="righttd">
              &nbsp;<asp:DropDownList ID="Question" runat="server">
                    <asp:ListItem>�ҵĳ������֣�</asp:ListItem>
                    <asp:ListItem>����õ�������˭��</asp:ListItem>
                    <asp:ListItem>����ϲ������ɫ��</asp:ListItem>
                    <asp:ListItem>����ϲ���ĵ�Ӱ��</asp:ListItem>
                    <asp:ListItem>����ϲ����Ӱ�ǣ�</asp:ListItem>
                    <asp:ListItem>����ϲ���ĸ�����</asp:ListItem>
                    <asp:ListItem>����ϲ����ʳ�</asp:ListItem>
                    <asp:ListItem>�����İ��ã�</asp:ListItem>
                    <asp:ListItem>����ѧУ��ȫ����ʲô��</asp:ListItem>
                    <asp:ListItem>�ҵ��������ǣ�</asp:ListItem>
                    <asp:ListItem>����ϲ����С˵�����֣�</asp:ListItem>
                    <asp:ListItem>����ϲ���Ŀ�ͨ�������֣�</asp:ListItem>
                    <asp:ListItem>��ĸ��/���׵����գ�</asp:ListItem>
                    <asp:ListItem>�������͵�һλ���˵����֣�</asp:ListItem>
                    <asp:ListItem>����ϲ�����˶���ȫ�ƣ�</asp:ListItem>
                    <asp:ListItem>����ϲ����һ��Ӱ��̨�ʣ�</asp:ListItem>
              </asp:DropDownList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>����𰸣�</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="Answer" runat="server" Width="268px"></asp:TextBox>
                  </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>���ڵ�����</strong></td>
              <td class="righttd">
                  &nbsp;<asp:Label ID="LabArea" runat="server"></asp:Label></td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��Աͷ��</strong></td>
              <td class="righttd">
                  &nbsp;<asp:TextBox CssClass="textbox" ID="TxtUserFace" runat="server" Width="268px"></asp:TextBox>
                <input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',0);" value="ѡ��ͼƬ">  </td>
          </tr>
          <tr style="display:none">
              <td align="right" class="lefttd" style="width: 84px; height: 37px;">
                  <strong>�Ʒѷ�ʽ��</strong></td>
              <td class="righttd" style="height: 37px">
              <asp:RadioButtonList ID="ChargeType" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True" Value="1">�Ƶ���</asp:ListItem>
                      <asp:ListItem Value="2">��Ч��</asp:ListItem>
                      <asp:ListItem Value="3">������</asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
          <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px">
                  <strong>��Ա״̬��</strong></td>
              <td class="righttd">
                  <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="true" Value="0">����</asp:ListItem>
                      <asp:ListItem Value="1">����</asp:ListItem>
                      <asp:ListItem Value="2">�����</asp:ListItem>
                      <asp:ListItem Value="3">���ʼ�����</asp:ListItem>
                  </asp:RadioButtonList></td>
          </tr>
          </table>
          </div>



    <%
    if (userid > 0)
    {
        string thumbarr = string.Empty;
        XmlDocument doc = new XmlDocument();
        doc.Load(Server.MapPath("~/config/uploadsetting.config"));
        XmlNode xn = doc.SelectSingleNode("//uploadsetting/item[@module='userface']");
        if (xn != null)
        {
            thumbarr = xn.SelectSingleNode("@thumbarr").InnerText;
        }
        string[] arr = null;
        if (!string.IsNullOrEmpty(thumbarr))
        {
            arr = thumbarr.Split(',');
        }
        Session["adminUserFaceID"] = userid.ToString();
   %>

 <div class="tab-page" id="tab2">
		  <h2 class="tab" id="H1" runat="server">�û�ͷ��</h2>
			<script type="text/javascript">
				 tabPane1.addTabPage( document.getElementById( "tab2" ) );
			</script>
       <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
         <tr>
              <td class="righttd" colspan="2"><%=Kesion.APPCode.UploadAPI.EchoUpload("adminuserface", this.TxtUserFace.ClientID) %>
              </td>
        </tr>
         <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"><strong>�Զ�����ͷ��</strong></td>
              <td class="righttd">
                    <table width="100%">
                        <tr>
                            <%
    if (arr != null)
    {
        foreach (string a in arr)
        {
            if (a.IndexOf("x") != -1)
            {
                               %>
                                <td style="height:<%=Utils.StrToInt(a.Split('x')[1])+80 %>px" valign="top">
                                 <div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b">
                                 <img userface="<%=a %>" onerror="this.src='../../sysimg/face/boy.jpg';" src="../../UploadFiles/avatar/<%=userid %>_<%=a %>.jpg" oldsrc="../../UploadFiles/avatar/<%=userid %>_<%=a %>.jpg"  width="<%=a.Split('x')[0] %>"  height="<%=a.Split('x')[1] %>"/>
                                </div></div></div></div>
                                    <div style="clear:both;line-height:22px; font-size:12px" class="tips">�ߴ磺<%=a %>
                                        <br />�ļ�����<%=userid.ToString() + "_" + a + ".jpg" %>
                                    </div>
                               </td>
                                <% 
            }
        }
    }%>     
                           
                        </tr>
                    </table>
              </td>
          </tr>
         <tr>
              <td align="right" class="lefttd" height="30" style="width: 84px"><strong>ԭͼ��</strong></td>
              <td class="righttd">
                 <img userface="<%=userid %>" onerror="this.src='../../sysimg/face/boy.jpg';" src="../../UploadFiles/avatar/<%=userid %>.jpg" oldsrc="../../UploadFiles/avatar/<%=userid %>.jpg" style="cursor:pointer;max-height:280px;max-width:280px" title="����鿴ԭͼ" onclick="window.open($(this).attr('src'));"/>
                   <div class="tips">
                    <br />�ļ�����<%=userid.ToString() + ".jpg" %>
                </div>
              </td>
        </tr>

 </table>
</div>
       <%} %>   
          <div class="tab-page" id="tab1">
		  <h2 class="tab" id="diyoption" runat="server">�Զ���ѡ��</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
			
 <table width="100%" border="0"  cellpadding="1" cellspacing="1" class="CTable">
          <tr>
           <td colspan="2">
               <div class="reg_box_l">
			     <ul id="useroptionsarea" runat="server"></ul>
                </div>
           </td>
          </tr>
       </table>
       </div>
       </div>

           <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      </div>
        
        <asp:TextBox ID="ComeUrl" Visible="false" runat="server"></asp:TextBox>
       
    </asp:Panel>
    
  </div>  
</asp:Content>

