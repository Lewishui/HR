<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskZJ" Title="问答专家管理" Codebehind="KS.AskZJ.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed" style="text-align:left">
     	<span class="quickSearch" style="padding-right:20px;"><strong>搜索专家：</strong><asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 

    	<asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
            onclick="BtnSearch_Click"  /></span>
        <ul>
            <li id="p1"><a href="?action=add"><b></b>添加问答专家</a></li>
        </ul>
    </div>  
   <div class="menu_top_fixed_height"></div>  
   <div class="content-area">   
    <div class="myTitle">问答专家管理</div>
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
       <asp:Label ID="lblEmptyZP" Text="<a href='javascript:history.back()'> &laquo;返回上一级</a>  " CssClass="text_hei_12" runat="server" Visible='<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>'>
</asp:Label>
        </ul></div></FooterTemplate>
        </asp:Repeater>
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx"><span>所有专家</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=1">
        <span>未审核的专家</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=2">
        <span>已审核的专家</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=3">
        <span>推荐的专家</span></a></li>
    <li<%=KSCMS.S("showType")=="4"?" class='active'":string.Empty %>>
        <a href="KS.AskZj.Aspx?showType=4">
        <span>固顶的专家</span></a></li>
 
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="没有任何专家!" PagerType="CustomNumeric" Width="99%" 
             GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>
         <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("zjId") %>" /></itemtemplate></asp:TemplateField>
                <asp:BoundField HeaderText="ID号" DataField="zjId" Visible="false" >
                <itemstyle horizontalalign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="审核">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&zjid=<%#Eval("zjID")%>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="照片">
                <itemstyle width="50px" horizontalalign="Center" />
                <itemtemplate>
                 <img src="<%# Eval("UserFace") %>" width="40" height="40" onerror="this.src='../../sysimg/face/boy.jpg';"/>
                 </itemtemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="专家姓名">
                <itemtemplate>
                <a href="../../<%=MyCache.GetAskCacheConfig(1) %>/zjview.aspx?username=<%# Eval("username") %>" target="_blank" title="<%# Eval("RealName") %>"><%# Eval("RealName") %></a></itemtemplate></asp:TemplateField><asp:TemplateField HeaderText="用户名">
                <itemstyle horizontalalign="Center" />
                <itemtemplate>
                <%# Eval("UserName") %></itemtemplate></asp:TemplateField><asp:BoundField HeaderText="联系电话" DataField="Tel">
                <itemstyle verticalalign="Middle"  horizontalalign="left"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="申请时间" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            
                 
               <asp:TemplateField HeaderText="推荐">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=recommend&zjid=<%#Eval("zjID")%>" <%# Convert.ToString(Eval("recommend"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="固顶">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=istop&zjid=<%#Eval("zjID")%>" <%# Convert.ToString(Eval("istop"))=="0"?"class='no' title='否'":"class='ok' title='是'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
                 <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="edit" ToolTip="修改" ID="LinkButton1" runat="server" commandargument=<%#Eval("zjId") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>

                <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25px"/>
             <itemtemplate>
             <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("zjId") %> commandname="del"></asp:LinkButton></itemtemplate></asp:TemplateField>
             </Columns>
             <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
           &nbsp;&nbsp;&nbsp;<input type="button" value="删除记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="批量审核" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="取消审核" onclick="BtnUnVerity_Click"/> <asp:Button ID="BtnRecommend" runat="server" Text="设为推荐" CssClass="button" 
            onclick="BtnRecommend_Click" />
        <asp:Button ID="BtnRecommend1" runat="server" CssClass="button" 
             Text="取消推荐" onclick="BtnRecommend1_Click" />
      </asp:Panel>
      
            
     <KS:Page ID="Page1" runat="server" />
    

</asp:Panel>
</div>

     
<asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="添加/修改专家" />
<div class="content-area">
    <div class="tab-page" id="AskZJPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AskZJPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2><script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script><table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
          
            <td class="lefttd" height="30" align="right" style="width: 102px"><strong>会员名称：</strong></td><td 
                        class="righttd" colspan="3">&nbsp;<asp:TextBox ID="TxtUserName" runat="server" CssClass="textbox"></asp:TextBox><span class="tips">会员名称必须是在会员系统中已存在的用户名。</span>
                        </td>
                        </tr><tr><td align="right" class="lefttd" height="30" 
                            style="width: 102px"><b>专家姓名：</b></td><td class="righttd">&nbsp;<asp:TextBox 
                                ID="TxtRealName" runat="server" CssClass="textbox" Width="121px"></asp:TextBox><span 
                                class="tips">填写真实姓名</span></td><td align="right" class="lefttd"><strong>出生年月：</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtBirthDay" runat="server" 
                            CssClass="textbox" /></td></tr><tr><td align="right" class="lefttd" height="30" style="width: 102px"> <strong>专家分类：</strong></td><td 
                            class="righttd">&nbsp;
                            <asp:DropDownList ID="DrptypeId" runat="server"><asp:ListItem 
                                Value="0">--选择专家分类--</asp:ListItem></asp:DropDownList><span 
                            class="tips">选择专家分类</span>&nbsp;</td><td align="right" class="lefttd"><strong>问答分类：</strong></td><td 
                            class="righttd">&nbsp;<asp:DropDownList ID="DrpClassID" runat="server">
                    <asp:ListItem Value="0">--选择问题分类--</asp:ListItem></asp:DropDownList></td></tr><tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>专家性别：</strong></td><td 
                            class="righttd">&nbsp;<asp:RadioButtonList ID="RdbSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="男" Selected="True">男</asp:ListItem><asp:ListItem Value="女">女</asp:ListItem></asp:RadioButtonList></td><td align="right" class="lefttd"><strong>专家照片：</strong></td><td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" runat="server" ID="TxtUserFace" />
                   &nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.TxtUserFace.ClientID %>',4,'');" value="选择图片">
                   </td>
              </tr>
             <tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>联系电话：</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtTel" runat="server" CssClass="textbox" />
                   </td>
                   <td align="right" class="lefttd"><strong>联系QQ：</strong></td><td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" runat="server" ID="TxtQQ" />
                   </td>
              </tr>
             <tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>执业证书：</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtZYZ" runat="server" CssClass="textbox" />
                            </td><td align="right" class="lefttd"><strong>选择地区：</strong></td><td class="righttd">
                           <script src="../../plus/area.aspx?pid=<%=pid %>&cityid=<%=cityId %>&countyid=<%=countyId %>" langueage="javascript"></script> </td></tr><tr><td 
                        align="right" class="lefttd" height="30" style="width: 102px"><strong>工作单位：</strong></td><td 
                        class="righttd">&nbsp;<asp:TextBox ID="TxtDanWei" runat="server" 
                            CssClass="textbox" /></td><td align="right" class="lefttd"><strong>联系地址：</strong></td><td 
                        class="righttd">&nbsp;<asp:TextBox ID="TxtAddress" runat="server" 
                        CssClass="textbox" /></td></tr><tr>
                  <td align="right" class="lefttd" height="30" style="width: 102px"><strong>擅长分类：</strong></td><td 
                            class="righttd">&nbsp;<asp:TextBox ID="TxtSCFL" runat="server" CssClass="textbox" />
                   </td>
                   <td align="right" class="lefttd"><strong>身份证号：</strong></td><td class="righttd">&nbsp;<asp:TextBox CssClass="textbox" runat="server" ID="TxtIdCard" />
                   </td>
              </tr>
          
          
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>专家介绍：</strong></td><td class="righttd" colspan="3">
                    
                    <asp:TextBox ID="TxtIntro" runat="server"  style="width:75%;height:200px;" TextMode="MultiLine"></asp:TextBox>
                <%
                    Kesion.APPCode.EditorAPI.EchoEditor("editor", TxtIntro.ClientID, "Basic", 0, false, true);    
               %>
                    
               </td></tr><tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>专家状态：</strong></td><td class="righttd" colspan="3">
                <asp:RadioButtonList ID="RdbVerify" runat="server" Width="137px" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="1" Selected="True">已审核</asp:ListItem><asp:ListItem Value="0">未审核</asp:ListItem></asp:RadioButtonList>&nbsp;&nbsp;<strong>是否推荐：</strong><asp:RadioButtonList ID="RdbRecommend" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="1">是</asp:ListItem><asp:ListItem Value="0" Selected="True">否</asp:ListItem></asp:RadioButtonList>&nbsp;&nbsp;<strong>是否固顶：</strong><asp:RadioButtonList ID="RdbIsTop" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
               <asp:ListItem Value="1">是</asp:ListItem><asp:ListItem Value="0" Selected="True">否</asp:ListItem></asp:RadioButtonList></td></tr></table></div></div><asp:Label ID="labsjinfo" runat="server"></asp:Label><div style="clear:both;text-align:center">
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
        <script>
            function CheckForm() {
                if (jQuery('#<%=this.TxtRealName.ClientID %>').val() == '') {
                    KesionJS.Alert('专家姓名必须输入!', "jQuery('#<%=this.TxtRealName.ClientID %>').focus()");
                    return false;
                }
                if (jQuery('#<%=this.TxtUserName.ClientID %>').val() == '') {
                    KesionJS.Alert('会员名称必须输入!', "jQuery('#<%=this.TxtUserName.ClientID %>').focus()");
                    return false;
                }

                return true;
            }

    </script>
    
   </div> 
</asp:Content>
