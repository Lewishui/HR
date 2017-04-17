<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyAddress" Title="Untitled Page" CodeBehind="MyAddress.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="r_tybox nomar">
    <script>
        function addAddress(){
            top.openWin('�����ջ���ַ', 'shop/MyAddressAdd.aspx?acion=add', true,860,550);
        }
        function modifyAddress(id){
            top.openWin('�޸��ջ���ַ', 'shop/MyAddressAdd.aspx?action=modify&id='+id, true,860,550)
        }
    </script>
    
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
 <div class="r_padbox">
 	<div class="padnav"><span><input type="button" class="button" onclick="addAddress();" value="�����ջ���ַ" /></span>
    <span class="tips">
    ���Ѵ���<span class="red"><%=num %></span> ���ջ���ַ�����ɴ���<span class="red">20</span>����</span></div>
        </HeaderTemplate>
    	<ItemTemplate>
       <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
       <tr class="title">
          <td >
          <%# Container.ItemIndex + 1%>��<%# Eval("Title") %>
           <span class="tips">
            <%# Convert.ToString(Eval("isdefault"))=="1"?"<span style='font-size:12px;font-weight:normal'>(Ĭ��)</span>":"" %>
           </span>
            <span style="float:right">
           <input type="button" class="button" value="�޸�" onclick="modifyAddress(<%# Eval("addressid") %>);"/>
           <input type="button" class="button" value="ɾ��" onclick="$.dialog.confirm('ȷ��ɾ�����ջ���ַ��',function(){location.href='shop/myaddress.aspx?action=del&id=<%# Eval("addressid") %>';},function(){});"/>
          </span>
          </td>
       </tr>
        <tr>
          <td class="splittd" style="padding-left:20px;line-height:22px;font-size:12px;">
           <span class="gray">�ջ��ˣ�</span><%# Eval("RealName") %> <br />
           <span class="gray">�绰��</span><%# !string.IsNullOrEmpty(Convert.ToString(Eval("tel")))?Eval("tel"):"" %><%# !string.IsNullOrEmpty(Convert.ToString(Eval("Mobile")))?"&nbsp;"+Eval("Mobile"):"" %><br />
           <span class="gray">�ʱࣺ</span><%# Eval("zipcode") %><br />
           <span class="gray">��ַ��</span><%# MyCache.GetAreaName(Utils.StrToInt(Eval("ProvinceID")), "city")%><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CityID")), "city")%><%# MyCache.GetAreaName(Utils.StrToInt(Eval("CountyID")), "city")%><%# Eval("Address") %>
          </td>
      </tr>      
      </table>   
    </ItemTemplate>
     <FooterTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
      <tr class="tdbg" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="2" >
                  ��û������ջ���ַ��
                  <div class="padnav"><span><input type="button" class="button" onclick="addAddress();" value="�����ջ���ַ" /></span></div>
                </td>
           </tr> 
    </table>
     </FooterTemplate>
    </asp:Repeater>
   </div> 
</div>
   
</asp:Content>

