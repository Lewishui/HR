<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_jsonInOrOut" Title="Untitled Page" Codebehind="KS.jsonInOrOut.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     
    <div id="manage_top" class="toptitle menu_top_fixed">json导入&导出</div>
    <div class="menu_top_fixed_height"></div> 
 <div class="content-area">   
    <script language='javascript'>
        $(document).ready(function () {
            SelectClass();
        });
        function SelectClass() {
            jQuery('#ajaxmsg', window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.jsonInOrOut.aspx",
                data: "action=getlabel",
                success: function (data) {
                    jQuery('#ajaxmsg', window.parent.document).toggle();
                    $("#<%=LstLabel.ClientID%>").empty().append(data);
                    SelectAll("<%=LstLabel.ClientID%>");
                }
            });

        }
        function SelectLabelClass(action,id) {
            jQuery('#ajaxmsg', window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.jsonInOrOut.aspx",
                data: "action="+action,
                success: function (data) {
                    if (data.indexOf("error:")!=-1){
                        alert(data);
                    }
                    jQuery('#ajaxmsg', window.parent.document).toggle();
                    $("#"+id).empty().append(data);
                    SelectAll(id);
                }
            });

        }

        function SelectAll(id) {
            $("#"+id+" OPTION").each(function () {
                $(this).attr("selected", true);
            });
          
        }
        function UnSelectAll(id) {
            $("#"+id+" OPTION").each(function () {
                $(this).attr("selected", false);
            });
        }
        function showOutType() {
            if (jQuery("#<%=RdbOutType.ClientID%> :radio[checked]").val() == "1") {
                jQuery("#folder").show();
                jQuery("#label").hide();
                SelectLabelClass('getlabelclass','<%=LstLabelFolder.ClientID%>');
            } else {
                jQuery("#folder").hide();
                jQuery("#label").show();
            }
        }
        function showImportType(){
            if (jQuery("#<%=RdbImportType.ClientID%> :radio[checked]").val() == "1") {
                jQuery("#importbyclass").show();
                jQuery("#importbylabel").hide();
                SelectLabelClass('getlabelclassdatasource','<%=LstImportClass.ClientID%>');
            } else {
                jQuery("#importbyclass").hide();
                jQuery("#importbylabel").show();
            }
        }
		</script>

    
     <div class="tab-page" id="labelOutPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("labelOutPanel"), 1)
         </script>
             
		<div class="tab-page" id="tab0">
		  <h2 class="tab">json导出</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>
    
    <table width="99%"  cellpadding="1" cellspacing="1" class="CTable">
         <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>导出方式</strong></td>
            <td colspan="2">
                <asp:RadioButtonList ID="RdbOutType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="True">按json</asp:ListItem>
                    <asp:ListItem Value="1">按一级json目录</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tbody id="label">

        <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>json列表</strong></td>
            <td>
                <asp:ListBox ID="LstLabel" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
            </td>
            <td>
               <input type='button' class="button"  name='Submit' value=' 选定所有 ' onclick='SelectAll("<%=LstLabel.ClientID%>")'>   
               <br><br>
                <input type='button' class="button" name='Submit' value=' 取消选定 ' onclick='UnSelectAll("<%=LstLabel.ClientID%>")'>
                <br><br><br><b>&nbsp;提示：按住“Ctrl”或“Shift”键可以多选</b>
            </td>
        </tr>
         <tr>
             <td class="lefttd" style="height: 30px; text-align:right"><strong>数据库名称</strong></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
              <asp:TextBox ID="TxtDataBaseName" runat="server" CssClass="textbox" /> 
                <span class="tips">如：json.mdb</span>
         </td>
      </tr>
       <tr>
             <td class="lefttd" style="height: 30px; text-align:left"></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
               <asp:Button ID="BtnOut" runat="server" CssClass="button" Text="确认导出选中的json" OnClick="BtnOut_Click" />
                <br /><br />
                <strong>一键导出操作：</strong><br />
               <asp:Button ID="Button1" runat="server" CssClass="button" Text="一键导出所有json" OnClick="Button1_Click"/>
         </td>
      </tr>
     </tbody>
     <tbody id="folder" style="display:none;">
          <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>json目录</strong></td>
            <td>
                <asp:ListBox ID="LstLabelFolder" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
            </td>
            <td>
               <input type='button' class="button"  name='Submit' value=' 选定所有 ' onclick='SelectAll("<%=LstLabelFolder.ClientID%>")'>   
               <br><br>
                <input type='button' class="button" name='Submit' value=' 取消选定 ' onclick='UnSelectAll("<%=LstLabelFolder.ClientID%>")'>
                <br><br><br><b>&nbsp;提示：按住“Ctrl”或“Shift”键可以多选</b>
            </td>
        </tr>
         <tr>
             <td class="lefttd" style="height: 30px; text-align:left"></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
               <asp:Button ID="Button7" runat="server" CssClass="button" Text="确认导出选中的json目录" OnClick="Button7_Click" />
         </td>
      </tr>
     </tbody>
    </table>
</div>

     <div class="tab-page" id="tab1">
		      <h2 class="tab">json导入</h2>
			    <script type="text/javascript">
			        tabPane1.addTabPage(document.getElementById("tab1"));
			    </script>
             <asp:Panel ID="Panel1" runat="server">
                 <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                       <tr class="Ctitle">
                        <td align="right" class="lefttd" height="30" style="width: 198px">
                        <b>要导入的json数据库</b>
                        </td>
                        <td class="righttd">
                           /App_Data/ <asp:TextBox ID="TxtLabelDataBase" Text="json.mdb" CssClass="textbox" runat="server"></asp:TextBox>
                            <span class="tips">如：/App_Data/json.mdb</span>
                         </td>
                    </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align:right"> <strong>导入方式</strong></td>
                        <td colspan="2">
                            <asp:RadioButtonList ID="RdbImportType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True">按json</asp:ListItem>
                                <asp:ListItem Value="1">按一级json目录</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                   </tr>
                     <tbody id="importbyclass" style="display:none">
                          <tr>
                                <td class="lefttd" style="height: 30px; text-align:right"> <strong>json目录</strong></td>
                                <td>
                                    <asp:ListBox ID="LstImportClass" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
                                </td>
                                <td>
                                   <input type='button' class="button"  name='Submit' value=' 选定所有 ' onclick='SelectAll("<%=LstLabelFolder.ClientID%>    ")'>   
                                   <br><br>
                                    <input type='button' class="button" name='Submit' value=' 取消选定 ' onclick='UnSelectAll("<%=LstLabelFolder.ClientID%>    ")'>
                                    <br><br><br><b>&nbsp;提示：按住“Ctrl”或“Shift”键可以多选</b>
                                </td>
                            </tr>
                             <tr>
                                 <td class="lefttd" style="height: 30px; text-align:left"></td>
                                <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                                   <asp:Button ID="Button8" runat="server" CssClass="button" Text="确认导入选中的json目录" OnClick="Button8_Click" />
                             </td>
                          </tr>
                     </tbody>
                   <tbody id="importbylabel">

                     <tr>
                        <td class="lefttd" style="height: 30px; text-align:left"></td>
                            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                               <asp:Button ID="Button5" runat="server" CssClass="button" Text=" 下一步 " OnClick="Button5_Click" />
                         </td>
                      </tr>
                       </tbody>
                 </table>
        </asp:Panel>
          <asp:Panel ID="Panel2" runat="server" Visible="false">
                <table width="99%"  cellpadding="1" cellspacing="1" class="CTable">
                <tr>
                    <td class="lefttd" style="height: 30px; text-align:right"> <strong>json列表</strong></td>
                    <td>
                        <asp:ListBox ID="LstINLabel" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
                    </td>
                    <td>
                       <input type='button' class="button"  name='Submit' value=' 选定所有 ' onclick='SelectAll("<%=LstINLabel.ClientID%>")'>   
                       <br><br>
                        <input type='button' class="button" name='Submit' value=' 取消选定 ' onclick='UnSelectAll("<%=LstINLabel.ClientID%>")'>
                        <br><br><br><b>&nbsp;提示：按住“Ctrl”或“Shift”键可以多选</b>
                    </td>
                </tr>
              <tr>
                     <td class="lefttd" style="height: 30px; text-align:right"><strong>重名处理方式</strong></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                      <asp:RadioButtonList runat="server" ID="RdbRepeatName" RepeatDirection="Horizontal" RepeatLayout="Flow">
                          <asp:ListItem Value="0" Selected="True">json重名自动重命名导入</asp:ListItem>
                          <asp:ListItem Value="1">重名跳过</asp:ListItem>
                          <asp:ListItem Value="2">重名覆盖</asp:ListItem>
                      </asp:RadioButtonList>
                 </td>
              </tr>
             <tr>
                     <td class="lefttd" style="height: 30px; text-align:right"><strong>导入json目录</strong></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                      <asp:Label ID="LabelClass" runat="server"></asp:Label>
                 </td>
              </tr>

               <tr>
                     <td class="lefttd" style="height: 30px; text-align:left"></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                       <asp:Button ID="Button6" runat="server" CssClass="button" Text="确认导入选中的json" OnClick="Button6_Click"/>
                 </td>
              </tr>

            </table>
         </asp:Panel>
    </div>
  </div>


     <script type="text/javascript">
            showtips('<span class="state"><strong>说明：</strong><br /></span><br/>1、json导出后放于App_Data目录下，建议下载到本地电脑备份;<br/>2、json导入前请先上传到App_Data目录下;');
	</script>
   </div> 
</asp:Content>

