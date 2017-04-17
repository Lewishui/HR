<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_System_PayMentPlat" Title="支付平台管理" Codebehind="KS.PaymentPlat.aspx.cs" %>
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

       <KS:TopNav ID="TopNav1" runat="server" Text="在线支付平台管理" />
    <div class="content-area">
        <asp:GridView  cssclass="CTable" ID="PayMentPlatList"  runat="server" AutoGenerateColumns="False" EmptyDataText="还没有添加在线支付平台!"
        GridLines="None" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="AreaList_RowCommand" OnRowCreated="AreaList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="序号" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%#Container.DataItemIndex+1%>            
                </ItemTemplate>             
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="支付平台Logo">
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate>
                <img src='<%# Eval("logo") %>' width="90" alt='<%# Eval("PlatName") %>' onerror="this.display='none'" />
             </ItemTemplate>
            </asp:TemplateField>   
            <asp:TemplateField HeaderText="支付平台名称">
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtPlatName" Text='<%#Eval("PlatName") %>' Width="280" runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="简要介绍">
            <ItemStyle HorizontalAlign="Left" Width="250px" />
            <ItemTemplate>
              <%#Eval("Remark") %>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="账号">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <%#Eval("AccountID") %>
             </ItemTemplate> 
            </asp:TemplateField>

            <asp:TemplateField HeaderText="启用">
            <ItemStyle HorizontalAlign="Center" Width="60px" />
            <ItemTemplate>
                <asp:CheckBox ID="ChkIsDisabled" runat="server" />
              <asp:HiddenField ID="HidIsDisabled" runat="server" Value='<%# Eval("IsDisabled") %>' />
             </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="默认">
            <ItemStyle HorizontalAlign="Center" Width="60px" />
            <ItemTemplate>
                <asp:RadioButton ID="RdbIsDefault" runat="server" />
              <asp:HiddenField ID="HidIsDefault" runat="server" Value='<%# Eval("IsDefault") %>' />
             </ItemTemplate>
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="排列序号">
            <ItemStyle HorizontalAlign="Center" Width="80px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtOrderID" Width="30px" style="text-align:center" Text='<%#Eval("OrderID") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="编辑">
                <itemstyle horizontalalign="Center" width="25"/>
                <itemtemplate>
                      <a  href="KS.PaymentPlat.aspx?action=modify&id=<%#Eval("id") %>" class="edit"></a>
               </itemtemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="申请">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="<%# Eval("ApplyUrl") %>" title="申请商户" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <KS:Foot ID="Foot1" runat="server" CancelButtonVisible="false" OnSubmit="Foot1_Submit" SubmitButtonText="批量保存(0)" />
    
   
</asp:Panel>
</div>

<asp:Panel ID="AddPannel" runat="server" Width="100%" Visible="false">
 <KS:TopNav ID="TopNav2" runat="server" Text="修改支付平台" />
 <div class="content-area">
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
        
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>支付平台名称：</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtPlatName" Width="300px" runat="server"></asp:TextBox> <span style="color:#ff0000">*</span>如支付宝等
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtPlatName"
                    ErrorMessage="请输入支付平台名称!"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>支付平台Logo：</b></td>
            <td class="righttd">
                <table>
                    <tr><td>&nbsp;<asp:TextBox CssClass="textbox" ID="TxtLogo" Width="300px" runat="server"></asp:TextBox></td>
                    <td><input type="button" class="button" onclick="SelectFiles('<%=this.TxtLogo.ClientID %>	',0);" value="选择Logo图片"></td>
                    <td style="padding-top:14px;"><%=Kesion.APPCode.UploadAPI.EchoUpload("classpic",this.TxtLogo.ClientID) %></td>
                 </tr>
                </table>
                  </td>
          </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>备注说明：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRemark" runat="server" Height="84px" TextMode="MultiLine"
                        Width="302px"></asp:TextBox></td>
            </tr>




            <tr id="showWeixin" runat="server" visible="false">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>微信支付参数配置：</strong></td>
                <td class="righttd">
                    &nbsp;商户号（MchId）：<asp:TextBox CssClass="textbox" ID="TxtMchId" runat="server"  Width="302px"></asp:TextBox>
                    <span class="tips">微信支付商户号</span>
                    <div class="hr_line"></div>
                    &nbsp;应用ID（AppId）：<asp:TextBox CssClass="textbox" ID="TxtAppId" runat="server" Width="302px"></asp:TextBox>
                        <span class="tips">在微信公众平台中 “开发者中心”栏目可以查看到</span>
                        <div class="hr_line"></div>
                    &nbsp;应用密钥（AppSecret）：<asp:TextBox CssClass="textbox" ID="TxtAppSecret" runat="server" Width="302px"></asp:TextBox>
                     <span class="tips">在微信公众平台中 “开发者中心”栏目可以查看到</span>
                     <div class="hr_line"></div>
                    &nbsp;API密钥（PaySignKey）：<asp:TextBox CssClass="textbox" MaxLength="32" ID="TxtPaySignKey" runat="server" Width="302px"></asp:TextBox>
                     <span class="tips">在微信商户平台中“账户设置”--“账户安全”--“设置API密钥”，只能修改不能查看</span>
                     <div class="hr_line"></div>
                    &nbsp;支付通知页面（NotifyUrl）：<asp:TextBox CssClass="textbox" ID="TxtNotifyUrl" runat="server" Width="302px" ReadOnly="true"></asp:TextBox>

                </td>
            </tr>
			<tr id="showWeixinPay" runat="server" visible="false">
			    <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>微信退款配置：</strong></td>
			<td>
			 <span class="tips">证书下载：微信商户平台--“账户中心”--“API安全”--“API证书”--“下载证书”</span><br />
					   &nbsp;证书路径（certPath）：<asp:TextBox CssClass="textbox" ID="cetPath" runat="server" Width="302px" ></asp:TextBox>
                     
					 <span class="tips">填写格式:X://file/apiclient_cert.p12</span><br />
					 <div class="hr_line"></div>
					   &nbsp;证书密码（password）：<asp:TextBox CssClass="textbox" ID="password" runat="server" Width="302px"></asp:TextBox>
                     <span class="tips">安装授权证书时填写的证书密码</span><br />

			</td>

			</tr>


             <tr id="showOther" runat="server">
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>支付账号设置：</strong></td>
                <td class="righttd">
                   
                    <input type="button" value="增加收款账号" onclick="addAccount()" class="button" />
                    <br /> <br />
                   <table class="CTable sTable ">
                       <tr class="CTitle">
                           <th>序号</th>
                           <th>支付编号(在线支付平台申请的商户编号)</th>
                           <th>支付密钥</th>
                           <th>操作</th>
                       </tr>
                       <tr>
                           <td class="Ctd" style="text-align:center;">1、</td>
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
                                        str+="<td class='Ctd' style='text-align:center;'>"+n+"、<input type='hidden' name='ids' value='"+dr["id"].ToString()+"'/></td>";
                                        str += "<td class='Ctd'><input type='text' class='textbox' value='" + dr["accountid"].ToString() + "' style='width:300px' name='account'/></td>";
                                        str += "<td class='Ctd'><input type='text' class='textbox' value='" + dr["md5key"].ToString() + "' style='width:400px' name='md5key'/></td>";
                                        str += @"<td class='Ctd' style='text-align:center'><a href='javascript:;' class='link-color' onclick=""delRow(" + dr["id"].ToString() + @");"">删除</a></td>";
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
                    		str+="<td class='Ctd' style='text-align:center;'>"+n+"、<input type='hidden' name='ids' value='0'/></td>";
                    		str+="<td class='Ctd'><input type='text' class='textbox' style='width:300px' name='account'/></td>";
                    		str+="<td class='Ctd'><input type='text' class='textbox' style='width:400px' name='md5key'/></td>";
                    		str+="<td class='Ctd' style='text-align:center'><a href='javascript:;' class='link-color' onclick=delItem("+n+")>删除</a></td>";
                    		str+="</tr>";
                    		n++;
                    		$("#showAccount").append(str);
                    	}
                    	function delItem(n){
                    		$("#r"+n).remove();
                    	}
                    	function delRow(id){
                    		if (confirm('确认删除吗？')){
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
                    <strong>商户RSA私钥：</strong></td>
                <td class="righttd">
                    <asp:TextBox CssClass="textbox" ID="TxtPrivateRSAKey" runat="server" Width="600px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                   
                    <div class="tips"><strong>说明：</strong>
                        <br />1、启用APP支付功能时必须填写；
                        <br />2、PKCS8格式（参数需转换为一行，不能包含空格），<a href="https://cshall.alipay.com/enterprise/help_detail.htm?help_id=474010&keyword=%C8%E7%BA%CE%C9%FA%B3%C9RSA%C3%DC%D4%BF&sToken=&from=search" target="_blank">如何生成RSA密钥</a></div>

                </td>
            </tr>

            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>手续费率：</strong></td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRate" runat="server" Width="35px"></asp:TextBox>%<br />
                    &nbsp;<asp:CheckBox ID="ChkRateByUser" runat="server" Text="手续费由付款人额外支付" /></td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>排列序号：</strong></td>
                <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtOrderID" runat="server" Width="56px"></asp:TextBox> <span style="color:#ff0000">*</span>(数字从小-&gt;大)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtOrderID"
                    ErrorMessage="请输入排序号!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>是否启用：</strong></td>
                <td class="righttd">
                    <asp:RadioButtonList ID="RdbIsDisabled" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
          <tr>
                <td align="right" class="lefttd" height="30" style="width: 198px">
                    <strong>显示平台：</strong></td>
                <td class="righttd">
                    <asp:CheckBoxList ID="CkbShowType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">PC端</asp:ListItem>
                        <asp:ListItem Value="1">手机端</asp:ListItem>
                        <asp:ListItem Value="2">微信端</asp:ListItem>
                        <asp:ListItem Value="3">APP端</asp:ListItem>
                    </asp:CheckBoxList>
                    <br />
                    <span class="tips">Tips:部分支付接口只支持部分终端使用，如：APP端支付目前仅支持微信支付和支付宝即时到账支付。</span>
                </td>
            </tr>
        </table>
      <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit"  />
</asp:Panel>

</div>

</asp:Content>

