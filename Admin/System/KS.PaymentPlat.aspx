<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_System_PayMentPlat" Title="֧��ƽ̨����" Codebehind="KS.PaymentPlat.aspx.cs" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<asp:Panel ID="ListPannel" runat="server" Width="100%">
<script type="text/javascript">
	function setRadio(nowRadio)
	{ 
		var myForm,objRadio;
		myForm=document.forms[0];
		for(var i=0;i<myForm.length;i++)
		{
			if(myForm.elements[i].type=="radio")
			{
				objRadio=myForm.elements[i];
				if(objRadio!=nowRadio && objRadio.name.indexOf("PayMentPlatList")>-1 && objRadio.name.indexOf("RdbIsDefault")>-1)
				{
					if(objRadio.checked)
					{
						objRadio.checked=false;
					}
				}
			}
		}
	}
 </script>

       <KS:TopNav ID="TopNav1" runat="server" Text="����֧��ƽ̨����" />
    <div class="content-area">
        <asp:GridView  cssclass="CTable" ID="PayMentPlatList"  runat="server" AutoGenerateColumns="False" EmptyDataText="��û���������֧��ƽ̨!"
        GridLines="None" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="AreaList_RowCommand" OnRowCreated="AreaList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="���" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%#Container.DataItemIndex+1%>            
                </ItemTemplate>             
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="֧��ƽ̨Logo">
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate>
                <img src='<%# Eval("logo") %>' width="90" alt='<%# Eval("PlatName") %>' onerror="this.display='none'" />
             </ItemTemplate>
            </asp:TemplateField>   
            <asp:TemplateField HeaderText="֧��ƽ̨����">
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtPlatName" Text='<%#Eval("PlatName") %>' Width="280" runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="��Ҫ����">
            <ItemStyle HorizontalAlign="Left" Width="250px" />
            <ItemTemplate>
              <%#Eval("Remark") %>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�˺�">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <%#Eval("AccountID") %>
             </ItemTemplate> 
            </asp:TemplateField>

            <asp:TemplateField HeaderText="����">
            <ItemStyle HorizontalAlign="Center" Width="60px" />
            <ItemTemplate>
                <asp:CheckBox ID="ChkIsDisabled" runat="server" />
              <asp:HiddenField ID="HidIsDisabled" runat="server" Value='<%# Eval("IsDisabled") %>' />
             </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ĭ��">
            <ItemStyle HorizontalAlign="Center" Width="60px" />
            <ItemTemplate>
                <asp:RadioButton ID="RdbIsDefault" runat="server" />
              <asp:HiddenField ID="HidIsDefault" runat="server" Value='<%# Eval("IsDefault") %>' />
             </ItemTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="�������">
            <ItemStyle HorizontalAlign="Center" Width="80px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtOrderID" Width="30px" style="text-align:center" Text='<%#Eval("OrderID") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="�༭">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                      <a  href="KS.PaymentPlat.aspx?action=modify&id=<%#Eval("id") %>" class="edit"></a>
               </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="����">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="<%# Eval("ApplyUrl") %>" title="�����̻�" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <KS:Foot ID="Foot1" runat="server" CancelButtonVisible="false" OnSubmit="Foot1_Submit" SubmitButtonText="��������(0)" />
    
   
</asp:Panel>
</div>

<asp:Panel ID="AddPannel" runat="server" Width="100%" Visible="false">
 <KS:TopNav ID="TopNav2" runat="server" Text="�޸�֧��ƽ̨" />
 <div class="content-area">
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>֧��ƽ̨���ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPlatName" Width="300px" runat="server"></asp:TextBox> <span style="color:#ff0000">*</span>��֧������
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtPlatName"
                    ErrorMessage="������֧��ƽ̨����!"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>֧��ƽ̨Logo��</b></td>
            <td class="righttd">
                <table>
                    <tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtLogo" Width="300px" runat="server"></asp:TextBox></td>
                    <td><input type="button" class="button" onclick="SelectFiles('<%=this.TxtLogo.ClientID %>	',0);" value="ѡ��LogoͼƬ"></td>
                    <td style="padding-top:14px;"><%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtLogo.ClientID) %></td>
                 </tr>
                </table>
                  </td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��ע˵����</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRemark" runat="server" Height="84px" TextMode="MultiLine"
                        Width="302px"></asp:TextBox></td>
            </tr>




            <tr id="showWeixin" runat="server" visible="false">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>΢��֧���������ã�</strong></td>
                <td class="righttd">
                    &nbsp;�̻��ţ�MchId����<asp:TextBox CssClass="textbox" ID="TxtMchId" runat="server"  Width="302px"></asp:TextBox>
                    <span class="tips">΢��֧���̻���</span>
                    <div class="hr_line"></div>
                    &nbsp;Ӧ��ID��AppId����<asp:TextBox CssClass="textbox" ID="TxtAppId" runat="server" Width="302px"></asp:TextBox>
                        <span class="tips">��΢�Ź���ƽ̨�� �����������ġ���Ŀ���Բ鿴��</span>
                        <div class="hr_line"></div>
                    &nbsp;Ӧ����Կ��AppSecret����<asp:TextBox CssClass="textbox" ID="TxtAppSecret" runat="server" Width="302px"></asp:TextBox>
                     <span class="tips">��΢�Ź���ƽ̨�� �����������ġ���Ŀ���Բ鿴��</span>
                     <div class="hr_line"></div>
                    &nbsp;API��Կ��PaySignKey����<asp:TextBox CssClass="textbox" MaxLength="32" ID="TxtPaySignKey" runat="server" Width="302px"></asp:TextBox>
                     <span class="tips">��΢���̻�ƽ̨�С��˻����á�--���˻���ȫ��--������API��Կ����ֻ���޸Ĳ��ܲ鿴</span>
                     <div class="hr_line"></div>
                    &nbsp;֧��֪ͨҳ�棨NotifyUrl����<asp:TextBox CssClass="textbox" ID="TxtNotifyUrl" runat="server" Width="302px" ReadOnly="true"></asp:TextBox>

                </td>
            </tr>
			<tr id="showWeixinPay" runat="server" visible="false">
			    <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>΢���˿����ã�</strong></td>
			<td>
			 <span class="tips">֤�����أ�΢���̻�ƽ̨--���˻����ġ�--��API��ȫ��--��API֤�顱--������֤�顱</span><br />
					   &nbsp;֤��·����certPath����<asp:TextBox CssClass="textbox" ID="cetPath" runat="server" Width="302px" ></asp:TextBox>
                     
					 <span class="tips">��д��ʽ:X://file/apiclient_cert.p12</span><br />
					 <div class="hr_line"></div>
					   &nbsp;֤�����루password����<asp:TextBox CssClass="textbox" ID="password" runat="server" Width="302px"></asp:TextBox>
                     <span class="tips">��װ��Ȩ֤��ʱ��д��֤������</span><br />

			</td>

			</tr>


             <tr id="showOther" runat="server">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>֧���˺����ã�</strong></td>
                <td class="righttd">
                   
                    <input type="button" value="�����տ��˺�" onclick="addAccount()" class="button" />
                    <br /> <br />
                   <table class="CTable sTable ">
                       <tr class="CTitle">
                           <th>���</th>
                           <th>֧�����(����֧��ƽ̨������̻����)</th>
                           <th>֧����Կ</th>
                           <th>����</th>
                       </tr>
                       <tr>
                           <td class="Ctd" style="text-align:center;">1��</td>
                           <td class="Ctd"><asp:TextBox CssClass="textbox" ID="TxtAccountID" runat="server" Width="300px"></asp:TextBox></td>
                           <td class="Ctd"><asp:TextBox CssClass="textbox" ID="TxtMD5Key" runat="server" Width="400px"></asp:TextBox></td>
                           <td class="Ctd" style="text-align:center">-</td>
                       </tr>
                       <tbody id="showAccount">
                           <%
                               int n =2;
                             using (DataTable dt = DataFactory.GetDataTable("select * From KS_PaymentPlatItem where isdefault=0 and payid="+id+" order by id"))
                             {
                                 if (dt.Rows.Count > 0)
                                 {
                                     foreach (DataRow dr in dt.Rows)
                                     {
                                        string str="<tr id='row"+dr["id"].ToString()+"'>";
                                        str+="<td class='Ctd' style='text-align:center;'>"+n+"��<input type='hidden' name='ids' value='"+dr["id"].ToString()+"'/></td>";
                                        str += "<td class='Ctd'><input type='text' class='textbox' value='" + dr["accountid"].ToString() + "' style='width:300px' name='account'/></td>";
                                        str += "<td class='Ctd'><input type='text' class='textbox' value='" + dr["md5key"].ToString() + "' style='width:400px' name='md5key'/></td>";
                                        str += @"<td class='Ctd' style='text-align:center'><a href='javascript:;' class='link-color' onclick=""delRow(" + dr["id"].ToString() + @");"">ɾ��</a></td>";
                                        str += "</tr>";
                                        Response.Write(str);
                                        n++;
                                     }
                                 }
                               
                             } %>
                       </tbody>
                   </table>
                   <div id="KeyTips" runat="server"></div>

                    <script>
                    	var n=<%=n%>;
                    	function addAccount(){
                    		var str='<tr id="r'+n+'">';
                    		str+="<td class='Ctd' style='text-align:center;'>"+n+"��<input type='hidden' name='ids' value='0'/></td>";
                    		str+="<td class='Ctd'><input type='text' class='textbox' style='width:300px' name='account'/></td>";
                    		str+="<td class='Ctd'><input type='text' class='textbox' style='width:400px' name='md5key'/></td>";
                    		str+="<td class='Ctd' style='text-align:center'><a href='javascript:;' class='link-color' onclick=delItem("+n+")>ɾ��</a></td>";
                    		str+="</tr>";
                    		n++;
                    		$("#showAccount").append(str);
                    	}
                    	function delItem(n){
                    		$("#r"+n).remove();
                    	}
                    	function delRow(id){
                    		if (confirm('ȷ��ɾ����')){
                    			jQuery.ajax({
                    				type: "POST",
                    				url: "KS.PaymentPlat.aspx",
                    				data: "id="+id+"&action=delrow",
                    				success: function (data) {
                    					jQuery("#row"+id).remove();
                    				}
                    			});
                    		}
                    	}
                   </script>
                </td>
            </tr>

            <tr id="showRSAKey" runat="server">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�̻�RSA˽Կ��</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtPrivateRSAKey" runat="server" Width="600px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                   
                    <div class="tips"><strong>˵����</strong>
                        <br />1������APP֧������ʱ������д��
                        <br />2��PKCS8��ʽ��������ת��Ϊһ�У����ܰ����ո񣩣�<a href="https://cshall.alipay.com/enterprise/help_detail.htm?help_id=474010&keyword=%C8%E7%BA%CE%C9%FA%B3%C9RSA%C3%DC%D4%BF&sToken=&from=search" target="_blank">�������RSA��Կ</a></div>

                </td>
            </tr>

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�������ʣ�</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRate" runat="server" Width="35px"></asp:TextBox>%<br />
                    &nbsp;<asp:CheckBox ID="ChkRateByUser" runat="server" Text="�������ɸ����˶���֧��" /></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>������ţ�</strong></td>
                <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtOrderID" runat="server" Width="56px"></asp:TextBox> <span style="color:#ff0000">*</span>(���ִ�С-&gt;��)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtOrderID"
                    ErrorMessage="�����������!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>�Ƿ����ã�</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbIsDisabled" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">��</asp:ListItem>
                        <asp:ListItem Value="0">��</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>��ʾƽ̨��</strong></td>
                <td class="righttd">
                    <asp:CheckBoxList ID="CkbShowType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">PC��</asp:ListItem>
                        <asp:ListItem Value="1">�ֻ���</asp:ListItem>
                        <asp:ListItem Value="2">΢�Ŷ�</asp:ListItem>
                        <asp:ListItem Value="3">APP��</asp:ListItem>
                    </asp:CheckBoxList>
                    <br />
                    <span class="tips">Tips:����֧���ӿ�ֻ֧�ֲ����ն�ʹ�ã��磺APP��֧��Ŀǰ��֧��΢��֧����֧������ʱ����֧����</span>
                </td>
            </tr>
        </table>
      <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit"  />
</asp:Panel>

</div>

</asp:Content>

