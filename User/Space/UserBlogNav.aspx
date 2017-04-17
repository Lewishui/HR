<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_UserBlogNav" Codebehind="UserBlogNav.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<div class="r_tybox nomar">
    <div class="tabs">	
			<ul>
				<li><a href="blogedit.aspx">空间参数设置</a></li>
				<li class='puton'><a href="UserBlogNav.aspx">空间导航管理</a></li>
				<li><a href="SetSpaceTemplate.aspx" target="_blank">空间模板绑定</a></li>
			</ul>
    </div>
	<div class="r_padbox">
    <asp:Panel runat="server" ID="MainPanel">
       
       <div class="clear"></div>
       <div class="padnav">
           <span><a href="UserBlogNav.aspx?action=addClass">添加一个导航</a> </span>
           <span><a href="UserBlogNav.aspx?action=addPages">添加一页面</a></span>

        </div>


        <asp:Panel ID="Panel1" runat="server">

    <KS:KSGV runat="server" ID="List" CssClass="border" AutoGenerateColumns="false" EmptyDataText="没有找到记录!" Width="100%" 
HorizontalAlign="center" GridLines="None" OnRowDataBound="List_RowDataBound"  OnRowCommand="List_RowCommand" >
            <Columns>
            <asp:BoundField HeaderText="编号" DataField="ID" >
                <ItemStyle HorizontalAlign="Center" Width="50px" CssClass="splittd" />
            </asp:BoundField>

                <asp:TemplateField HeaderText="名称" HeaderStyle-HorizontalAlign="left">
                 <ItemStyle CssClass="splittd" Height="30px" />
                    <ItemTemplate>
                        <%# Eval("NavName") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="别名" HeaderStyle-HorizontalAlign="left">
                <ItemStyle CssClass="splittd" />
                    <ItemTemplate>
                        <%# Eval("NavAlias") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="排序" HeaderStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" CssClass="splittd" />
                    <ItemTemplate>
                        <%# Eval("NavOrderId") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="必须" >
                <ItemStyle HorizontalAlign="Center" CssClass="splittd" />
                    <ItemTemplate>
                        <%# Eval("OwnSys").ToString() == "0"? "否":"<span style='color:red'>是</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="启用" >
                 <ItemStyle HorizontalAlign="Center" CssClass="splittd" />
                    <ItemTemplate>
                        <%# Eval("Flag").ToString() == "0"? "否":"<span style='color:red'>是</span>" %>
                    </ItemTemplate>
                </asp:TemplateField>
            
            <asp:TemplateField HeaderText="↓管理操作">
            <ItemStyle HorizontalAlign="Center" CssClass="splittd" />
             <itemtemplate>

             <asp:LinkButton ID="LinkButton1" runat="server" commandargument=<%#Eval("ID") %> commandname="modifyBlog">修改</asp:LinkButton> &nbsp;&nbsp;
             <asp:LinkButton ID="LinkButton10" runat="server" commandargument=<%#Eval("ID") %> commandname="enable">启用</asp:LinkButton> &nbsp;&nbsp;
                 <asp:LinkButton runat="server" id="LinkButton11" commandargument=<%#Eval("ID") %> commandname="delBlog">删除</asp:LinkButton>
            </itemtemplate>
           
            </asp:TemplateField>
            
        </Columns>
                <HeaderStyle CssClass="title" />
                <RowStyle CssClass="tdbg" />
        </KS:KSGV>

        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="100%">
              
              
              <div class="fy_box"><KS:Page ID="Pages" runat="server" /></div>
                    
    	</div>     
    </div>   
    </asp:Panel>
</asp:Panel>








    </asp:Panel>

    


    <asp:Panel runat="server" ID="BlogClassPanel" Visible="false">
         <% Kesion.APPCode.EditorAPI.EchoHead();%>
		
        <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
                
                            <script type="text/javascript">
                                reg = /[a-zA-z]/;
                            function CheckForm1() {
                                if (jQuery("#<%=this.txtNavName.ClientID %>").val() == '') {
                                    KesionJS.Alert('请输入导航显示名称!', 'jQuery("#<%=this.txtNavName.ClientID %>").focus()');
	                            return false
                                }
                                if (jQuery("#<%=this.txtNavAlias.ClientID %>").val() == '' || !reg.test(jQuery("#<%=this.txtNavAlias.ClientID %>").val())) {
                                    KesionJS.Alert('请输入导航别名，且只能为字母！', 'jQuery("#<%=this.txtNavAlias.ClientID %>").focus()');
                                    return false
                                }
                                if (!is_number(jQuery("#<%=this.txtOrderID.ClientID %>").val()) || jQuery("#<%=this.txtOrderID.ClientID %>").val() == '') {
                                    KesionJS.Alert('序号请填写有数数字！', 'jQuery("#<%=this.txtOrderID.ClientID %>").focus()');
                                    return false;
                                }

                                return true;

                            }

                            </script>

                          <tr class="tdbg">
                            <td  class="lefttd">名称：</td>
                            <td style="text-align:left"><asp:TextBox ID="txtNavName" CssClass="textbox"   runat="server"></asp:TextBox><span class="tips">导航显示名称。</span><span style="color: red">*</span></td>
                          </tr>
              
                            <tr class="tdbg">
                            <td  class="lefttd">别名：</td>
                            <td style="text-align:left"><asp:TextBox ID="txtNavAlias" CssClass="textbox"   runat="server"></asp:TextBox><span class="tips">别名（英文）。</span><span style="color: red">*</span></td>
                          </tr>
                            <asp:HiddenField runat="server" ID="modify" Value="0" />
                          <tr class="tdbg">
                            <td class="lefttd">序号：</td>
                            <td style="text-align:left"><asp:TextBox ID="txtOrderID" CssClass="textbox" runat="server"></asp:TextBox><span class="tips">导航序号(越大越靠前)</span>
                            <span style="color: red">* 
                                </span></td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">导航描述（先填）：</td>
                            <td style="text-align:left"><textarea runat="server" class="textbox" id="textDescript" style="width:500px; height:100px;"></textarea><span style="color: red">* 
                                  </span></td>
                          </tr>

            <tr class="tdbg" runat="server" id="customPage">
            <td class="lefttd">页面内容：</td>
            <td style="text-align:left">
                
                <asp:TextBox ID="textCustomPage" TextMode="multiLine" style="width:600px;height:300px;" runat="server"></asp:TextBox>
                 <%
                     Kesion.APPCode.EditorAPI.EchoEditor("editor", textCustomPage.ClientID, "Basic", 0, false, true, true, false);    
             %>
               </td>
            </tr>

                        <tr class="tdbg">
                            <td class="lefttd">是否启用：</td>
                            <td style="text-align:left">
                                <asp:CheckBox runat="server" ID="chkFlag" Checked="true" />
                            </td>
                          </tr>
                          
						<tr class="tdbg">
                            <td class="lefttd" style="border-bottom:0px;" height="40">&nbsp;</td>
                            <td style="text-align:left;border-bottom:0px;">
                                
                                <div class="cz_btn">
                                	<span><asp:Button OnClientClick="return(CheckForm1());" ID="Button1" CssClass="button" runat="server" OnClick="Button1_Click" Text="OK!确定保存" /></span>
                              		<span><input type="button" runat="server" onclick="location.href = 'UserBlogNav.aspx'" class="button" value=" 返 回 " /></span>
                                </div>
                            </td>
                        </tr>

            </table>

    </asp:Panel>



</asp:Content>

