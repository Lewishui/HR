<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Role" Title="管理员类型管理" Codebehind="KS.AdminRole.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
             <ul>
            <li><strong>管理操作：</strong></li>
            <li><a href="KS.Admin.aspx">管理员管理</a></li>
            <li class="curr"><a href="KS.AdminRole.aspx">管理员类型</a></li>
        </ul>
    </div>
 <div class="menu_top_fixed_height"></div> 
 <div class="content-area">
 <div class="myTitle">管理员类型管理<span style="float:right"><asp:Button ID="Button2" runat="server" Text="新增管理员类型" CssClass="button" OnClick="Button2_Click" /></span></div>
 
         <asp:Repeater ID="list" runat="server">
          <HeaderTemplate>
           <table width="99%" align="center" cellpadding="0" cellspacing="0" class="CTable">
           <tr class="CTitle">
				<th scope="col" style="width:30px;">类型ID</th><th scope="col">管理员类型名称</th>
                <th scope="col" style="width:50px">序号</th>
                <th scope="col" style="width:25px">编辑</th>
                <th scope="col" style="width:25px">删除</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr onmouseover="jQuery('#a<%# Eval("RoleID") %>').show();this.className='CtrMouseOver'" onmouseout="jQuery('#a<%# Eval("RoleID") %>').hide();this.className='CtrMouseOut'">
             <td class="Ctd" align="center"><%# Eval("RoleID") %></td>
             <td class="Ctd" style="height:30px;width:350px;"><%# Eval("RoleName") %>
             </td>
             <td class="Ctd" align="center"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd" align="center">
              <a href="KS.AdminRole.aspx?action=edit&roleid=<%# Eval("RoleID") %>" class="edit" title="编辑"></a>
             </td>
              <td class="Ctd" align="center">
              <a  class="delete"  title="删除" href="KS.AdminRole.aspx?Action=del&roleID=<%# Eval("RoleID") %>" onclick="return(confirm('此操作不可逆，确定删除管理员类型吗?'));"></a>
             </td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
               <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="6">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="Button2_Click"> 还没有添加任何管理员类型，点此添加管理员类型&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>
         
          <KS:Page ID="Page1" runat="server" />
         

         
        </asp:Panel> 
        
        <asp:Panel ID="ClassAdd" runat="server" Width="100%">
        <script type="text/javascript">
        <!--
	
            function CheckForm() {
                if (jQuery('#<%=this.TxtRoleName.ClientID %>').val() == '') {
                    KesionJS.Alert('请输入管理员类型名称！', "jQuery('#<%=this.TxtRoleName.ClientID %>').focus()");
                    return false;
                }

            }
	       
	        //-->
	    </script>
</div>	    

        <KS:TopNav ID="TopNav1" runat="server" Text="添加管理员类型" />
<div class="content-area">
        
        
       	<div class="tab-page" id="DepartPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("DepartPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本信息</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   
                    <tr>
                    <td class="lefttd" height="30" align="right" style="width: 155px">
                        <strong> 管理员类型名称：</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="TxtRoleName" runat="server"></asp:TextBox>
                        <span class="tips">*请输入管理员类型名称，如仓管员、发货员等。</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtRoleName"
                            ErrorMessage="RequiredFieldValidator">请输入管理员类型名称，如仓管员、发货员等。</asp:RequiredFieldValidator></td>
                  </tr>
                  <tr>
                    <td align="right"  class="lefttd" style="width: 155px; height: 50px;">
                        <strong>简要介绍：</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" Height="100px" ID="TxtIntro" runat="server" rows="8" TextMode="MultiLine" Width="383px"></asp:TextBox>
                       <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtIntro.ClientID %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtIntro.ClientID %>');"></a>
                          
                        </td>
                  </tr>
                 
               <tr>
                    <td align="right"  class="lefttd" style="width: 155px; height: 50px;">
                        <strong>排列序号：</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox textarea" ID="TxtOrderID" runat="server"  Width="50px"></asp:TextBox>
                        <span class="tips">说明：序号越小排在越前面。</span>
                        </td>
                  </tr>
              
          </table>	

        </div>
      
      
      <div style="clear:both;text-align:center"><br />
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
        
        
    </div>    
</asp:Content>