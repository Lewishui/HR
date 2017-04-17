<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskZJ" Title="�ʴ�ר�ҹ���" Codebehind="KS.AskZJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed" style="text-align:left">
     	<span class="quickSearch" style="padding-right:20px;"><strong>����ר�ң�</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    	<asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
            onclick="BtnSearch_Click"  /></span>
        <ul>
            <li id="p1"><a href="?action=add"><b></b>����ʴ�ר��</a></li>
        </ul>
    </div>  
   <div class="menu_top_fixed_height"></div>  
   <div class="content-area">   
    <div class="myTitle">�ʴ�ר�ҹ���</div>
<style>
.categorynav{line-height:25px;margin:0 auto;margin-bottom:10px;border:1px solid #DEEFFA;background-color:#F7FBFE;padding:5px 0px 5px 10px; height:100%; overflow:hidden;}
ul,li{padding:0px;margin:0px}
.categorynav li{width:160px;float:left;}
</style>

        <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate><div class="categorynav"><ul></HeaderTemplate>
        <ItemTemplate>   
            <li><img align="absmiddle" src="../../sysimg/tree/folderclosed.gif" /><a href='?typeid=<%# Eval("typeid") %>'><%#Eval("typename")%></a></li>
        </ItemTemplate>
        <FooterTemplate>
       <asp:Label ID="lblEmptyZP" Text="<a href='javascript:history.back()'> &laquo;������һ��</a>  " CssClass="text_hei_12" runat="server" Visible='<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>'>
</asp:Label>
        </ul></div></FooterTemplate>
        </asp:Repeater>
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx"><span>����ר��</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=1">
        <span>δ��˵�ר��</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=2">
        <span>����˵�ר��</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=3">
        <span>�Ƽ���ר��</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=4">
        <span>�̶���ר��</span></a></li>
 
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="û���κ�ר��!" PagerType="CustomNumeric" Width="99%" 
             GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>
         <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("zjId") %>" /></itemtemplate></asp:TemplateField>
                <asp:BoundField HeaderText="ID��" DataField="zjId" Visible="false" >
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="���">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&zjid=<%#Eval("zjID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="��Ƭ">
                <itemstyle width="50px" horizontalalign="Center" />
                <itemtemplate>
                 <img src="<%# Eval("UserFace") %>" width="40" height="40" onerror="this.src='../../sysimg/face/boy.jpg';"/>
                 </itemtemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="ר������">
                <itemtemplate>
                <a href="../../<%=MyCache.GetAskCacheConfig(1) %>/zjview.aspx?username=<%# Eval("username") %>" target="_blank" title="<%# Eval("RealName") %>"><%# Eval("RealName") %></a></itemtemplate></asp:TemplateField><asp:TemplateField HeaderText="�û���">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%# Eval("UserName") %></itemtemplate></asp:TemplateField><asp:BoundField HeaderText="��ϵ�绰" DataField="Tel">
                <itemstyle verticalalign="Middle"  horizontalalign="left"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="����ʱ��" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            
                 
               <asp:TemplateField HeaderText="�Ƽ�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&zjid=<%#Eval("zjID")%>" <%# Convert.ToString(Eval("recommend"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="�̶�">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=istop&zjid=<%#Eval("zjID")%>" <%# Convert.ToString(Eval("istop"))=="0"?"class='no' title='��'":"class='ok' title='��'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="edit" ToolTip="�޸�" ID="LinkButton1" runat="server" commandargument=<%#Eval("zjId") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>

                <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="25px"/>
             <itemtemplate>
             <asp:LinkButton CssClass="delete" ToolTip="ɾ��" runat="server" id="delete" commandargument=<%#Eval("zjId") %> commandname="del"></asp:LinkButton></itemtemplate></asp:TemplateField>
             </Columns>
             <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">ȫ��ѡ��</label>
            
           &nbsp;&nbsp;&nbsp;<input type="button" value="ɾ����¼" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="�������" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="ȡ�����" onclick="BtnUnVerity_Click"/> <asp:Button ID="BtnRecommend" runat="server" Text="��Ϊ�Ƽ�" CssClass="button" 
            onclick="BtnRecommend_Click" />
        <asp:Button ID="BtnRecommend1" runat="server" CssClass="button" 
             Text="ȡ���Ƽ�" onclick="BtnRecommend1_Click" />
      </asp:Panel>
      
            
     <KS:Page ID="Page1" runat="server" />
    

</asp:Panel>
</div>

     
<asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="���/�޸�ר��" />
<div class="content-area">
    <div class="tab-page" id="AskZJPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AskZJPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2><script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script><table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
          
            <td class="lefttd" height="30" align="right" style="width: 102px"><strong>��Ա���ƣ�</strong></td><td 
                        class="righttd" colspan="3">&nbsp;<asp:TextBox ID="TxtUserName" runat="server" CssClass="textbox"></asp:TextBox><span class="tips">��Ա���Ʊ������ڻ�Աϵͳ���Ѵ��ڵ��û�����</span>
                        </td>
                        </tr><tr><td align="right" class="lefttd" height="30" 
                            style="width: 102px"><b>ר��������</b></td><td class="righttd">&nbsp;<asp:TextBox 
                                ID="TxtRealName" runat="server" CssClass="textbox" Width="121px"></asp:TextBox><span 
                                class="tips">��д��ʵ����</span></td><td align="right" class="lefttd"><strong>�������£�</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtBirthDay" runat="server" 
                            CssClass="textbox" /></td></tr><tr><td align="right" class="lefttd" height="30" style="width: 102px"> <strong>ר�ҷ��ࣺ</strong></td><td 
                            class="righttd">&nbsp;
                            <asp:DropDownList ID="DrptypeId" runat="server"><asp:ListItem 
                                Value="0">--ѡ��ר�ҷ���--</asp:ListItem></asp:DropDownList><span 
                            class="tips">ѡ��ר�ҷ���</span>&nbsp;</td><td align="right" class="lefttd"><strong>�ʴ���ࣺ</strong></td><td 
                            class="righttd">&nbsp;<asp:DropDownList ID="DrpClassID" runat="server">
                    <asp:ListItem Value="0">--ѡ���������--</asp:ListItem></asp:DropDownList></td></tr><tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>ר���Ա�</strong></td><td 
                            class="righttd">&nbsp;<asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="��" Selected="True">��</asp:ListItem><asp:ListItem Value="Ů">Ů</asp:ListItem></asp:RadioButtonList></td><td align="right" class="lefttd"><strong>ר����Ƭ��</strong></td><td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" runat="server" ID="TxtUserFace" />
                   &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',4,'');" value="ѡ��ͼƬ">
                   </td>
              </tr>
             <tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>��ϵ�绰��</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtTel" runat="server" CssClass="textbox" />
                   </td>
                   <td align="right" class="lefttd"><strong>��ϵQQ��</strong></td><td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" runat="server" ID="TxtQQ" />
                   </td>
              </tr>
             <tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>ִҵ֤�飺</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtZYZ" runat="server" CssClass="textbox" />
                            </td><td align="right" class="lefttd"><strong>ѡ�������</strong></td><td class="righttd">
                           <script src="../../plus/area.aspx?pid=<%=pid %>&cityid=<%=cityId %>&countyid=<%=countyId %>" langueage="javascript"></script> </td></tr><tr><td 
                        align="right" class="lefttd" height="30" style="width: 102px"><strong>������λ��</strong></td><td 
                        class="righttd">&nbsp;<asp:TextBox ID="TxtDanWei" runat="server" 
                            CssClass="textbox" /></td><td align="right" class="lefttd"><strong>��ϵ��ַ��</strong></td><td 
                        class="righttd">&nbsp;<asp:TextBox ID="TxtAddress" runat="server" 
                        CssClass="textbox" /></td></tr><tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>�ó����ࣺ</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtSCFL" runat="server" CssClass="textbox" />
                   </td>
                   <td align="right" class="lefttd"><strong>���֤�ţ�</strong></td><td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" runat="server" ID="TxtIdCard" />
                   </td>
              </tr>
          
          
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>ר�ҽ��ܣ�</strong></td><td class="righttd" colspan="3">
                    
                    <asp:TextBox ID="TxtIntro" runat="server"  style="width:75%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                <%
                    Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtIntro.ClientID, "Basic", 0, false, true);    
               %>
                    
               </td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>ר��״̬��</strong></td><td class="righttd" colspan="3">
                <asp:RadioButtonList ID="RdbVerify" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="1" Selected="True">�����</asp:ListItem><asp:ListItem Value="0">δ���</asp:ListItem></asp:RadioButtonList>&nbsp;&nbsp;<strong>�Ƿ��Ƽ���</strong><asp:RadioButtonList ID="RdbRecommend" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="1">��</asp:ListItem><asp:ListItem Value="0" Selected="True">��</asp:ListItem></asp:RadioButtonList>&nbsp;&nbsp;<strong>�Ƿ�̶���</strong><asp:RadioButtonList ID="RdbIsTop" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
               <asp:ListItem Value="1">��</asp:ListItem><asp:ListItem Value="0" Selected="True">��</asp:ListItem></asp:RadioButtonList></td></tr></table></div></div><asp:Label ID="labsjinfo" runat="server"></asp:Label><div style="clear:both;text-align:center">
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
        <script>
            function CheckForm() {
                if (jQuery('#<%=this.TxtRealName.ClientID %>').val() == '') {
                    KesionJS.Alert('ר��������������!', "jQuery('#<%=this.TxtRealName.ClientID %>').focus()");
                    return false;
                }
                if (jQuery('#<%=this.TxtUserName.ClientID %>').val() == '') {
                    KesionJS.Alert('��Ա���Ʊ�������!', "jQuery('#<%=this.TxtUserName.ClientID %>').focus()");
                    return false;
                }

                return true;
            }

    </script>
    
   </div> 
</asp:Content>
