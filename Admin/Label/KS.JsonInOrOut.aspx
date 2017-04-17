<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_jsonInOrOut" Title="Untitled Page" Codebehind="KS.jsonInOrOut.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     
    <div id="manage_top" class="toptitle menu_top_fixed">json����&����</div>
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
		  <h2 class="tab">json����</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>
    
    <table width="99%"  cellpadding="1" cellspacing="1" class="CTable">
         <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>������ʽ</strong></td>
            <td colspan="2">
                <asp:RadioButtonList ID="RdbOutType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="True">��json</asp:ListItem>
                    <asp:ListItem Value="1">��һ��jsonĿ¼</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tbody id="label">

        <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>json�б�</strong></td>
            <td>
                <asp:ListBox ID="LstLabel" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
            </td>
            <td>
               <input type='button' class="button"  name='Submit' value=' ѡ������ ' onclick='SelectAll("<%=LstLabel.ClientID%>")'>   
               <br><br>
                <input type='button' class="button" name='Submit' value=' ȡ��ѡ�� ' onclick='UnSelectAll("<%=LstLabel.ClientID%>")'>
                <br><br><br><b>&nbsp;��ʾ����ס��Ctrl����Shift�������Զ�ѡ</b>
            </td>
        </tr>
         <tr>
             <td class="lefttd" style="height: 30px; text-align:right"><strong>���ݿ�����</strong></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
              <asp:TextBox ID="TxtDataBaseName" runat="server" CssClass="textbox" /> 
                <span class="tips">�磺json.mdb</span>
         </td>
      </tr>
       <tr>
             <td class="lefttd" style="height: 30px; text-align:left"></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
               <asp:Button ID="BtnOut" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�е�json" OnClick="BtnOut_Click" />
                <br /><br />
                <strong>һ������������</strong><br />
               <asp:Button ID="Button1" runat="server" CssClass="button" Text="һ����������json" OnClick="Button1_Click"/>
         </td>
      </tr>
     </tbody>
     <tbody id="folder" style="display:none;">
          <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>jsonĿ¼</strong></td>
            <td>
                <asp:ListBox ID="LstLabelFolder" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
            </td>
            <td>
               <input type='button' class="button"  name='Submit' value=' ѡ������ ' onclick='SelectAll("<%=LstLabelFolder.ClientID%>")'>   
               <br><br>
                <input type='button' class="button" name='Submit' value=' ȡ��ѡ�� ' onclick='UnSelectAll("<%=LstLabelFolder.ClientID%>")'>
                <br><br><br><b>&nbsp;��ʾ����ס��Ctrl����Shift�������Զ�ѡ</b>
            </td>
        </tr>
         <tr>
             <td class="lefttd" style="height: 30px; text-align:left"></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
               <asp:Button ID="Button7" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�е�jsonĿ¼" OnClick="Button7_Click" />
         </td>
      </tr>
     </tbody>
    </table>
</div>

     <div class="tab-page" id="tab1">
		      <h2 class="tab">json����</h2>
			    <script type="text/javascript">
			        tabPane1.addTabPage(document.getElementById("tab1"));
			    </script>
             <asp:Panel ID="Panel1" runat="server">
                 <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                       <tr class="Ctitle">
                        <td align="right" class="lefttd" height="30" style="width: 198px">
                        <b>Ҫ�����json���ݿ�</b>
                        </td>
                        <td class="righttd">
                           /App_Data/ <asp:TextBox ID="TxtLabelDataBase" Text="json.mdb" CssClass="textbox" runat="server"></asp:TextBox>
                            <span class="tips">�磺/App_Data/json.mdb</span>
                         </td>
                    </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align:right"> <strong>���뷽ʽ</strong></td>
                        <td colspan="2">
                            <asp:RadioButtonList ID="RdbImportType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True">��json</asp:ListItem>
                                <asp:ListItem Value="1">��һ��jsonĿ¼</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                   </tr>
                     <tbody id="importbyclass" style="display:none">
                          <tr>
                                <td class="lefttd" style="height: 30px; text-align:right"> <strong>jsonĿ¼</strong></td>
                                <td>
                                    <asp:ListBox ID="LstImportClass" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
                                </td>
                                <td>
                                   <input type='button' class="button"  name='Submit' value=' ѡ������ ' onclick='SelectAll("<%=LstLabelFolder.ClientID%>    ")'>   
                                   <br><br>
                                    <input type='button' class="button" name='Submit' value=' ȡ��ѡ�� ' onclick='UnSelectAll("<%=LstLabelFolder.ClientID%>    ")'>
                                    <br><br><br><b>&nbsp;��ʾ����ס��Ctrl����Shift�������Զ�ѡ</b>
                                </td>
                            </tr>
                             <tr>
                                 <td class="lefttd" style="height: 30px; text-align:left"></td>
                                <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                                   <asp:Button ID="Button8" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�е�jsonĿ¼" OnClick="Button8_Click" />
                             </td>
                          </tr>
                     </tbody>
                   <tbody id="importbylabel">

                     <tr>
                        <td class="lefttd" style="height: 30px; text-align:left"></td>
                            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                               <asp:Button ID="Button5" runat="server" CssClass="button" Text=" ��һ�� " OnClick="Button5_Click" />
                         </td>
                      </tr>
                       </tbody>
                 </table>
        </asp:Panel>
          <asp:Panel ID="Panel2" runat="server" Visible="false">
                <table width="99%"  cellpadding="1" cellspacing="1" class="CTable">
                <tr>
                    <td class="lefttd" style="height: 30px; text-align:right"> <strong>json�б�</strong></td>
                    <td>
                        <asp:ListBox ID="LstINLabel" runat="server" SelectionMode="Multiple" Width="350" Height="300"></asp:ListBox>
                    </td>
                    <td>
                       <input type='button' class="button"  name='Submit' value=' ѡ������ ' onclick='SelectAll("<%=LstINLabel.ClientID%>")'>   
                       <br><br>
                        <input type='button' class="button" name='Submit' value=' ȡ��ѡ�� ' onclick='UnSelectAll("<%=LstINLabel.ClientID%>")'>
                        <br><br><br><b>&nbsp;��ʾ����ס��Ctrl����Shift�������Զ�ѡ</b>
                    </td>
                </tr>
              <tr>
                     <td class="lefttd" style="height: 30px; text-align:right"><strong>��������ʽ</strong></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                      <asp:RadioButtonList runat="server" ID="RdbRepeatName" RepeatDirection="Horizontal" RepeatLayout="Flow">
                          <asp:ListItem Value="0" Selected="True">json�����Զ�����������</asp:ListItem>
                          <asp:ListItem Value="1">��������</asp:ListItem>
                          <asp:ListItem Value="2">��������</asp:ListItem>
                      </asp:RadioButtonList>
                 </td>
              </tr>
             <tr>
                     <td class="lefttd" style="height: 30px; text-align:right"><strong>����jsonĿ¼</strong></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                      <asp:Label ID="LabelClass" runat="server"></asp:Label>
                 </td>
              </tr>

               <tr>
                     <td class="lefttd" style="height: 30px; text-align:left"></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                       <asp:Button ID="Button6" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�е�json" OnClick="Button6_Click"/>
                 </td>
              </tr>

            </table>
         </asp:Panel>
    </div>
  </div>


     <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span><br/>1��json���������App_DataĿ¼�£��������ص����ص��Ա���;<br/>2��json����ǰ�����ϴ���App_DataĿ¼��;');
	</script>
   </div> 
</asp:Content>

