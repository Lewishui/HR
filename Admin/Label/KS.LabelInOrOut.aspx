<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_LabelInOrOut" Title="Untitled Page" CodeBehind="KS.LabelInOrOut.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     
    <div id="manage_top" class="toptitle menu_top_fixed"><span style="float:right;font-weight:normal;"><%=templateName %></span>��ǩ����&����</div>
    <div class="menu_top_fixed_height"></div> 
 <div class="content-area">   
    <script language='javascript'>
        $(document).ready(function () {
            $("#<%=DrpLabelType.ClientID%>").change(function(){
                SelectClass(this.value);
            });
            SelectClass(0);
        });
        function SelectClass(LabelType) {
            jQuery('#ajaxmsg', window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.LabelInOrOut.aspx",
                data: "templateId=<%=templateId%>&labelType=" + LabelType + "&action=getlabel",
                success: function (data) {
                    jQuery('#ajaxmsg', window.parent.document).toggle();
                    $("#<%=LstLabel.ClientID%>").empty().append(data);
                    SelectAll();
                }
            });

        }
        function SelectLabelClass(action,id) {
            jQuery('#ajaxmsg', window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.LabelInOrOut.aspx",
                data: "templateId=<%=templateId%>&action="+action,
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
		  <h2 class="tab">��ǩ����</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>
    
    <table width="99%"  cellpadding="1" cellspacing="1" class="CTable">
         <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>������ʽ</strong></td>
            <td colspan="2">
                <asp:RadioButtonList ID="RdbOutType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="True">����ǩ</asp:ListItem>
                    <asp:ListItem Value="1">��һ����ǩĿ¼</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tbody id="label">
        <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>��ǩ����</strong></td>
            <td colspan="2"><asp:DropDownList ID="DrpLabelType" runat="server">
                <asp:ListItem Value="0" Selected="True">ȫ��</asp:ListItem>
                <asp:ListItem Value="1">���ű�ǩ��������</asp:ListItem>
                <asp:ListItem Value="2">�м���ǩ����ʽ��</asp:ListItem>
                <asp:ListItem Value="3">�߼���ǩ��SQL��</asp:ListItem>
                <asp:ListItem Value="4">�Զ����ǩ����̬��</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>��ǩ�б�</strong></td>
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
                <span class="tips">�磺Label.MDB</span>
         </td>
      </tr>
       <tr>
             <td class="lefttd" style="height: 30px; text-align:left"></td>
            <td class="righttd" colspan="2" style="height: 30px; text-align: left">
               <asp:Button ID="BtnOut" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�еı�ǩ" OnClick="BtnOut_Click" />
                <br /><br />
                <strong>һ������������</strong><br />
               <asp:Button ID="Button1" runat="server" CssClass="button" Text="һ�������������ű�ǩ��������" OnClick="Button1_Click"/>
               <asp:Button ID="Button2" runat="server" CssClass="button" Text="һ�����������м���ǩ����ʽ��" OnClick="Button2_Click"/>
               <asp:Button ID="Button3" runat="server" CssClass="button" Text="һ���������и߼���ǩ��SQL��" OnClick="Button3_Click"/>
               <asp:Button ID="Button4" runat="server" CssClass="button" Text="һ�����������Զ����ǩ����̬��" OnClick="Button4_Click"/>
         </td>
      </tr>
     </tbody>
     <tbody id="folder" style="display:none;">
          <tr>
            <td class="lefttd" style="height: 30px; text-align:right"> <strong>��ǩĿ¼</strong></td>
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
               <asp:Button ID="Button7" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�еı�ǩĿ¼" OnClick="Button7_Click" />
         </td>
      </tr>
     </tbody>
    </table>
</div>

     <div class="tab-page" id="tab1">
		      <h2 class="tab">��ǩ����</h2>
			    <script type="text/javascript">
			        tabPane1.addTabPage(document.getElementById("tab1"));
			    </script>
             <asp:Panel ID="Panel1" runat="server">
                 <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                       <tr class="Ctitle">
                        <td align="right" class="lefttd" height="30" style="width: 198px">
                        <b>Ҫ����ı�ǩ���ݿ�</b>
                        </td>
                        <td class="righttd">
                           /App_Data/ <asp:TextBox ID="TxtLabelDataBase" Text="Label.Mdb" CssClass="textbox" runat="server"></asp:TextBox>
                            <span class="tips">�磺/App_Data/Label.Mdb</span>
                         </td>
                    </tr>
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align:right"> <strong>���뷽ʽ</strong></td>
                        <td colspan="2">
                            <asp:RadioButtonList ID="RdbImportType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True">����ǩ</asp:ListItem>
                                <asp:ListItem Value="1">��һ����ǩĿ¼</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                   </tr>
                     <tbody id="importbyclass" style="display:none">
                          <tr>
                                <td class="lefttd" style="height: 30px; text-align:right"> <strong>��ǩĿ¼</strong></td>
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
                                   <asp:Button ID="Button8" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�еı�ǩĿ¼" OnClick="Button8_Click" />
                             </td>
                          </tr>
                     </tbody>
                   <tbody id="importbylabel">
                    <tr>
                        <td class="lefttd" style="height: 30px; text-align:right"> <strong>Ҫ����ı�ǩ����</strong></td>
                        <td colspan="2"><asp:DropDownList ID="DrpINLabelType" runat="server">
                            <asp:ListItem Value="1">���ű�ǩ��������</asp:ListItem>
                            <asp:ListItem Value="2">�м���ǩ����ʽ��</asp:ListItem>
                            <asp:ListItem Value="3">�߼���ǩ��SQL��</asp:ListItem>
                            <asp:ListItem Value="4">�Զ����ǩ����̬��</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
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
                    <td class="lefttd" style="height: 30px; text-align:right"> <strong>��ǩ�б�</strong></td>
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
                          <asp:ListItem Value="0" Selected="True">��ǩ�����Զ�����������</asp:ListItem>
                          <asp:ListItem Value="1">��������</asp:ListItem>
                          <asp:ListItem Value="2">��������</asp:ListItem>
                      </asp:RadioButtonList>
                 </td>
              </tr>
             <tr>
                     <td class="lefttd" style="height: 30px; text-align:right"><strong>�����ǩĿ¼</strong></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                      <asp:Label ID="LabelClass" runat="server"></asp:Label>
                 </td>
              </tr>

               <tr>
                     <td class="lefttd" style="height: 30px; text-align:left"></td>
                    <td class="righttd" colspan="2" style="height: 30px; text-align: left">
                       <asp:Button ID="Button6" runat="server" CssClass="button" Text="ȷ�ϵ���ѡ�еı�ǩ" OnClick="Button6_Click"/>
                 </td>
              </tr>

            </table>
         </asp:Panel>
    </div>
  </div>


     <script type="text/javascript">
            showtips('<span class="state"><strong>˵����</strong><br /></span><br/>1����ǩ���������App_DataĿ¼�£��������ص����ص��Ա���;<br/>2����ǩ����ǰ�����ϴ���App_DataĿ¼��;');
	</script>
   </div> 
</asp:Content>

