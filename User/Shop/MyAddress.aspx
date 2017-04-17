<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyAddress" Title="Untitled Page" CodeBehind="MyAddress.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="r_tybox nomar">
    <script>
        function addAddress(){
            top.openWin('新增收货地址', 'shop/MyAddressAdd.aspx?acion=add', true,860,550);
        }
        function modifyAddress(id){
            top.openWin('修改收货地址', 'shop/MyAddressAdd.aspx?action=modify&id='+id, true,860,550)
        }
    </script>
    
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
 <div class="r_padbox">
 	<div class="padnav"><span><input type="button" class="button" onclick="addAddress();" value="新增收货地址" /></span>
    <span class="tips">
    您已创建<span class="red"><%=num %></span> 个收货地址，最多可创建<span class="red">20</span>个。</span></div>
        </HeaderTemplate>
    	<ItemTemplate>
       <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
       <tr class="title">
          <td >
          <%# Container.ItemIndex + 1%>、<%# Eval("Title") %>
           <span class="tips">
            <%# Convert.ToString(Eval("isdefault"))=="1"?"<span style='font-size:12px;font-weight:normal'>(默认)</span>":"" %>
           </span>
            <span style="float:right">
           <input type="button" class="button" value="修改" onclick="modifyAddress(<%# Eval("addressid") %>);"/>
           <input type="button" class="button" value="删除" onclick="$.dialog.confirm('确定删除该收货地址吗？',function(){location.href='shop/myaddress.aspx?action=del&id=<%# Eval("addressid") %>';},function(){});"/>
          </span>
          </td>
       </tr>
        <tr>
          <td class="splittd" style="padding-left:20px;line-height:22px;font-size:12px;">
           <span class="gray">收货人：</span><%# Eval("RealName") %> <br />
           <span class="gray">电话：</span><%# !string.IsNullOrEmpty(Convert.ToString(Eval("tel")))?Eval("tel"):"" %><%# !string.IsNullOrEmpty(Convert.ToString(Eval("Mobile")))?"&nbsp;"+Eval("Mobile"):"" %><br />
           <span class="gray">邮编：</span><%# Eval("zipcode") %><br />
           <span class="gray">地址：</span><%# MyCache.GetAreaName(Utils.StrToInt(Eval("ProvinceID")), "city")%><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CityID")), "city")%><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CountyID")), "city")%><%# Eval("Address") %>
          </td>
      </tr>      
      </table>   
    </ItemTemplate>
     <FooterTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="2" >
                  还没有添加收货地址！
                  <div class="padnav"><span><input type="button" class="button" onclick="addAddress();" value="新增收货地址" /></span></div>
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
   </div> 
</div>
   
</asp:Content>

