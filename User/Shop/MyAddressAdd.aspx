<%@ Page Language="C#" MasterPageFile="~/User/CssFrame.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyAddressAdd" Title="Untitled Page" Codebehind="MyAddressAdd.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script>
        $(function () {
            $("#ProvinceID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text);
            });
            $("#CityID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text);
            });
            $("#CountyID").change(function () {
                $("#showselectarea").html(jQuery("#ProvinceID option:selected").get(0).text + jQuery("#CityID option:selected").get(0).text + jQuery("#CountyID option:selected").get(0).text);
            });

        });

        function checkform() {
            var provinceid = jQuery("#ProvinceID option:selected").val();
            if (provinceid == '') {
                $.dialog.alert('��ѡ���ջ�����!');
                return false;
            }
            var cityid = jQuery("#CityID option:selected").val();
            if (cityid == '') {
                $.dialog.alert('��ѡ���ջ�����!');
                return false;
            }


            var countyid = 0;
            if (jQuery("#CountyID")[0]) {
                countyid = jQuery("#CountyID option:selected").val();
            }
           if (countyid == '') {
                $.dialog.alert('��ѡ���ջ�����!');
                return false;
            }
            var address = jQuery("#<%=this.TxtAddress.ClientID %>").val();
            if (address == '') {
                $.dialog.alert('�������ջ���ַ!', function() {
                jQuery("#<%=this.TxtAddress.ClientID %>").focus();
                });
                return false;
            }
            var zipcode = jQuery("#<%=this.TxtZipCode.ClientID %>").val();
            if (zipcode == '') {
                $.dialog.alert('��������������!', function() {
                jQuery("#<%=this.TxtZipCode.ClientID %>").focus();
                });
                return false;
            }
            var realname = jQuery("#<%=this.TxtRealName.ClientID %>").val();
            if (realname == '') {
                $.dialog.alert('�������ջ�������!', function() {
                jQuery("#<%=this.TxtRealName.ClientID %>").focus();
                });
                return false;
            }
            var tel = jQuery("#<%=this.TxtTel.ClientID %>").val();
            var mobile = jQuery("#<%=this.TxtMobile.ClientID %>").val();
            if (tel == '' && mobile == '') {
                $.dialog.alert('�̶��绰���ֻ�����Ҫ��һ��!', function () {
                    jQuery("#<%=this.TxtMobile.ClientID %>").focus();
                });
                return false;
            }
            if (tel != '' && tel.length < 7) {
                KesionJS.Alert('�̶��绰��ʽ����ȷ������������!','jQuery("#<%=this.TxtTel.ClientID %>").focus()');
                return false;
            }

            if (mobile != '') {
                if (ismobile(mobile) == false) {
                    KesionJS.Alert('�ֻ����벻��ȷ������������!','jQuery("#<%=this.TxtMobile.ClientID %>").focus()');
                    return false;
                }
            }

            var title = jQuery("#<%=this.TxtTitle.ClientID %>").val();
            if (title == '') {
                $.dialog.alert('������һ����ַ����!', function () {
                    jQuery("#<%=this.TxtTitle.ClientID %>").focus();
                });
                return false;
            }
            return true;
        }
    </script>
   <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border"> 
    <tr class="title1" style="display:none">
     <td colspan=5>
     <%=KSCMS.S("action") == "modify" ? "�޸�" : "���"%>�ջ���ַ</td>
    </tr>
             
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30" >�ջ���ַ��</td>
                <td class="righttd">
                  <script src="../../plus/area.aspx?ext=true&pid=<%=proid %>&cityid=<%=cityid %>&countyid=<%=countyid %>"></script>
                </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">�ء���ַ��</td>
                <td class="righttd"><span id="showselectarea"><%=addStr%></span>
                    <asp:TextBox CssClass="textbox" ID="TxtAddress" runat="server" MaxLength="100"></asp:TextBox>
                     <span style="color:Red">*</span>
                     <span class="tips">ֻ����ֵ���ַ�����ƺ�</span>
                    </td>
            
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">�������룺</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtZipCode" runat="server" MaxLength="10"></asp:TextBox><span style="color:Red">&nbsp;*</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30" >�� �� �ˣ�</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtRealName" runat="server" MaxLength="40"></asp:TextBox><span style="color:Red">&nbsp;*</span>
                 <span class="tips">����д��ʵ���������������ջ�</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">�ֻ����룺</td>
                <td class="righttd">
                  <asp:TextBox CssClass="textbox" ID="TxtMobile" runat="server" Width="120" MaxLength="30"></asp:TextBox> &nbsp;��̶��绰 <asp:TextBox CssClass="textbox" ID="TxtTel" runat="server"  Width="120"></asp:TextBox>
              <span class="tips">�ֻ��͵绰������дһ��</span></td>
            </tr>

             
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">�������䣺</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtEmail" runat="server" MaxLength="100"></asp:TextBox>
                 <span class="tips">Ϊ�˷�����ٶ���״̬֪ͨ,�����������ĳ�������</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">��ַ������</td>
                <td class="righttd">
                 <asp:TextBox CssClass="textbox" ID="TxtTitle" runat="server" MaxLength="100"></asp:TextBox>
                 <span class="tips">����һ���׼ǵ����ƣ��磺���͵���������͵���˾���ȡ�</span>
               </td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="lefttd" height="30">����ΪĬ�ϣ�</td>
                <td class="righttd">
                 <asp:CheckBox ID="CkbIsDefault" runat="server" Text="Ĭ���ջ���ַ" />
               </td>
            </tr>
             
        </table>
        <asp:HiddenField ID="HidID" runat="server" Value="0" />
              <div style="text-align:center">
              <div class="cz_btn">
              	<span><asp:Button ID="Button1" 
                      OnClientClick="return(checkform())" CssClass="button" runat="server" 
                      Text="OK,�ύ" onclick="Button1_Click" /></span>
                      <span><input type="reset" class="button" value="����¼��" /></span>
                    </div>
               </div>       

</asp:Content>

