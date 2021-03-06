<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PostInfoManage" Title="Untitled Page" Codebehind="PostManage.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemCreated="Repeater1_ItemCreated">
    <HeaderTemplate>

    <div class="r_tybox nomar">
    
    	<div class="tabs">	
            <ul>    
               <li<%if (string.IsNullOrEmpty(KSCMS.S("s"))) Response.Write (" class='puton'"); %>><a href="PostManage.aspx">全部</a></li>
               <li<%if (KSCMS.S("s")=="0") Response.Write (" class='puton'"); %>><a href="PostManage.aspx?s=0">待审核信息</a></li>
               <li<%if (KSCMS.S("s")=="1") Response.Write (" class='puton'"); %>><a href="PostManage.aspx?s=1">已审核信息</a></li>
               <li<%if (KSCMS.S("s")=="2") Response.Write (" class='puton'"); %>><a href="PostManage.aspx?s=2">草稿信息</a></li>
               <li<%if (KSCMS.S("s")=="3") Response.Write (" class='puton'"); %>><a href="PostManage.aspx?s=3">退稿信息</a></li>
            </ul>
        </div>
		<div class="r_padbox">
      <table id="tablist" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="title">
        	<td width="50" align="center">选择</td>
        	<td align="center">标题</td>
            <td align="center" width="110"> 录入 </td>
            <td width="100" align="center"> 更新时间 </td>
            <td align="center" width="50">状态</td>
	        <td align="center" width="120">管理操作</td>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
       <tr class="tdbg">
          <td class="splittd" align="center">
          <input type="checkbox"<%# Convert.ToString(Eval("Verify"))=="1"?" disabled":"" %> name="ids" value="<%#Eval("InfoID") %>" /></td>
          <td class="splittd">
          <a href='../model/view.aspx?m_id=<%#Eval("ChannelID") %>&id=<%#Eval("InfoID") %>' target="_blank"><%#Eval("Title")%></a>
          </td>
          <td class="splittd" align="center"><%#Eval("Inputer") %></td>
          <td class="splittd" align="center">
          <%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate")))%>
          </td>
          <td class="splittd" align="center">
          <%#GetStatus(Convert.ToInt16(Eval("Verify"))) %>
          <asp:HiddenField ID="ChannelID" runat="server" Value='<%#Eval("ChannelID") %>' />
          <asp:HiddenField ID="ClassID" runat="server" Value='<%#Eval("ClassID") %>' />
          <asp:HiddenField ID="Verify" runat="server" Value='<%#Eval("Verify") %>' />
          <asp:HiddenField ID="InfoID" runat="server" Value='<%#Eval("InfoID") %>' />
          </td>
          <td class="splittd" align="center">
          
              <%# Convert.ToString(Eval("Verify"))!="1" || (Convert.ToString(Eval("Verify"))=="1" && MyCache.GetCacheModel(Convert.ToInt16(Eval("ChannelID")),28)!="0")?@"<a href=""PostInfo.aspx?classid="+Eval("classid")+"&infoId="+Eval("infoid")+@""">修改</a> <a href=""javascript:;"" onclick=""$.dialog.confirm('确定删除吗?',function(){location.href='postManage.aspx?action=del&id="+Eval("InfoID")+@"';},function(){});"">删除</a>":"-" %>
          </td>
      </tr>      
    </ItemTemplate>
     <FooterTemplate>
     <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="10">
                  找不到任何记录！
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>

		<div class="cz_btn">
             <span><input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/>全选</span>
             <span><asp:Button ID="ButtonDel" class="button" runat="server" Text="删除" onclick="ButtonDel_Click"/></span>
		</div>
    	<div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>

		</div>
	</div>
 </div>
</asp:Content>

