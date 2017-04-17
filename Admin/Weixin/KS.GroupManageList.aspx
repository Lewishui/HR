<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.Mobile.Admin.Weixin.KS_GroupManageList" Codebehind="KS.GroupManageList.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
<link href="/admin/weixin/images/style.css" rel="stylesheet" />
      <script type="text/javascript">
          function HuoquGroup() {
              //获取分组
              jQuery(parent.document).find("#ajaxmsg").toggle();
              $.ajax({
                  url: "KS.GroupManageList.aspx?action=Huoqu&rnd=" + Math.random(),
                  context: document.body,
                  type: "get",
                  success: function (data) {
                      jQuery('#ajaxmsg', window.parent.document).toggle();
                      if (data =='ok') {
                          KesionJS.Alert("恭喜,获取分组成功", "location.reload();");
                      } else {
                          KesionJS.Alert("对不起,获取分组失败", "location.reload();");
                      }
                      jQuery('#ajaxmsg', window.parent.document).fadeOut("slow");
                  }
              });
              return false;
          }  
          </script>
    <script>
        function OnAdd() {
            top.openWin('创建分组', 'weixin/KS.GroupManageList.aspx?action=Add', false, 500, 250)
        }

    </script>

    <asp:Panel ID="Panel1" runat="server">


          <KS:TopNav ID="TopNav1" runat="server" />
    <div class="content-area">      
        <div class="message top_message">
           由于缓存的原因，两个小时才会更新数据库，其实微信平台已经更新啦！注意最多只能100组！
         </div>
       <div>

<%--        <asp:Button ID="Button1" runat="server" Text="获取分组" OnClientClick="return(HuoquGroup())"/>--%>

          
             <a Class="Btn_add_group"  href="javascript:void(0)" onclick=" top.openWin('创建分组', 'weixin/KS.GroupManageList.aspx?action=Add', true, 500, 250)" title="创建分组">+创建分组</a>

       </div>
        <div class="groupmanage">
            <table style="width:100%;margin: 10px 0;border: 1px solid #e7e7eb;text-align:center;" cellpadding="0" cellspacing="0">
      <asp:Repeater ID="RepeaterGroupList" runat="server"  OnItemCommand="RepeaterGroupList_ItemCommand" OnItemDataBound="RepeaterGroupList_ItemDataBound">
        <HeaderTemplate>
          <tr class="RepeaterGroup">
            <th width="17.5%">序号</th>
            <th width="17.5%">ID编号</th>
            <th width="17.5%">分组名称</th>
            <th width="17.5%">分组人数</th>
            <th width="30%">操作</th>
          </tr>
        </HeaderTemplate>
        <ItemTemplate>
          <tr style='background-color: <%#(Container.ItemIndex%2==0)?"#fff":"#F3F5F7"%>'>
            <td><asp:Label ID="lbXuHao" runat="server" Text=""></asp:Label></td>
            <td><%# Eval("GroupID") %></td>
            <td><%# Eval("GroupName") %></td>
            <td><%# Eval("GroupCount") %></td>
            <td>
               <a  href="javascript:void(0)" onclick=" top.openWin('创建分组', 'weixin/KS.GroupManageList.aspx?action=modify&groupId=<%#Eval("GroupID") %>', true, 500, 250)" title="修改分组" class="updata_name">修改分组名称</a> 
              
                <asp:LinkButton ID="LinkBtnDeleteGroup" runat="server" CommandName="DeleteGroups" CommandArgument='<%#Eval("GroupID")%>'  CssClass="delete_group">删除分组</asp:LinkButton>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
        </div>
           <KS:Page ID="Page1" runat="server" />
    </asp:Panel>
<asp:Panel ID="Panel2" runat="server">
    <table style=" width:100%;margin:20px auto 20px auto;" cellpadding="0" cellspacing="0">
      
      <tr>
        <td style="text-align:right;">分组名称：</td>
        <td> 
          <asp:TextBox ID="txtGroupName" CssClass="inputstyle" runat="server" MaxLength="30"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
            <asp:Button ID="Btn_Save" runat="server" Text="保存" OnClick="Btn_Save_Click" cssClass="save_group"/>

            <asp:Button ID="Btn_Modify" runat="server" Text="修改" OnClick="Btn_Modify_Click" cssClass="save_group"/>
      </tr>
    </table>
</asp:Panel>
</div>

</asp:Content>
