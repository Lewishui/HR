<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskConfig" Title="�ʴ�ϵͳ��������" Codebehind="KS.AskConfig.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="�ʴ�ϵͳƵ����������"></KS:topnav>
    <div class="content-area">
    
		<div class="tab-page" id="SystemAskPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SystemAskPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
    <table id="tbs" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ʴ�Ƶ��״̬��</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="AskStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0">�ر�</asp:ListItem>
                    <asp:ListItem Value="1" Selected>����</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�ʴ�Ƶ�����ƣ�</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtAskName" runat="server"></asp:TextBox>
                <span class="tips">���ʴ�Ƶ����</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>ǰ̨��װĿ¼��</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="AskInstallDir" runat="server"></asp:TextBox>
                <span class="tips">��WenDa,Ask��</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�󶨶���������</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtAskDomain" runat="server"></asp:TextBox>
              <span class="tips">�磺http://Ask.kesion.com�����治�ܼ�"/"��û�а󶨶������������ա�</span>
                </td>
        </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�������Ƿ���Ҫ��ˣ�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskPubVefifyTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">����Ҫ���,ֱ�ӷ���</asp:ListItem>
                <asp:ListItem Value="1">��Ҫ��̨��˺�,���ɷ���</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>ÿ����Աÿ�����������ʣ�</strong></td>
            <td class="righttd">
                <asp:TextBox ID="TxtLimitPostNum" runat="server" Text="0" CssClass="textbox" Width="50px" style="text-align:center"></asp:TextBox>
                ������
                <span class="tips">TIPS:��������������롰0����</span>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�ش������Ƿ���Ҫ��ˣ�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskReplyVerifyTF" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0">����Ҫ���</asp:ListItem>
                <asp:ListItem Value="1">��Ҫ���</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�Ƿ������ο����ʣ�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">���������飩</asp:ListItem>
                <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�Ƿ������οͻش�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskReplyVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">���������飩</asp:ListItem>
                <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�����˿���ɾ�����ѵ����⣺</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="RdbDelTopic" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">������</asp:ListItem>
                <asp:ListItem Value="1">��ɾ��δ���������</asp:ListItem>
                <asp:ListItem Value="2">����ɾ����������</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>����ɾ���ش��ߵĴ𰸣�</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskDelAnswer" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">������</asp:ListItem>
                <asp:ListItem Value="1">�������˿���ɾ���û��Ĵ�</asp:ListItem>
                <asp:ListItem Value="2">�ش��߿���ɾ���Լ��Ĵ�</asp:ListItem>
                <asp:ListItem Value="3">�����ߺͻش��߶�����ɾ����</asp:ListItem>
                </asp:RadioButtonList>
                <span class="tips">TIPS����Ѵ𰸲���ɾ����</span>
                </td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�����˿��Իش��Լ����ʵ����⣺</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskAnswerOwnQuestion" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">������</asp:ListItem>
                <asp:ListItem Value="1">����</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
       <tr>
           <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>����ش�������û��飺</strong>
                 <div class="tips">TIPS:�������벻Ҫ��ѡ��</div>
             </td>
             <td class="righttd" ID="ViewGroupIDArea" runat="server">
                </td>
          </tr>
         </table>
    </div>
         
         
          
         
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab3"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�û��ش�һ���������õĻ��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore1" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">ͬһ�������ֻ���ͻ���һ�Σ�������ô���Ҫ��ˣ�����Ҫ����Ա���ͨ�������ͻ��֡�</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ش������߲��������⽱���Ļ��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore2" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�û������������õĻ��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore3" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
            <span class="tips">ָ������������Ѵ𰸵Ĳ�����</span></td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>���ⱻѡΪ�����Ƽ����������õĻ��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore4" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>���ⱻѡΪ�����Ƽ���ѻش������õĻ��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore5" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�û�����һ����������Ļ��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore6" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">���óɸ������ʾ������Ҫ����,��������Ҫ�����ֻ�к�̨���ͨ�������ͻ��֡�</span>
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>���ⱻɾ����ȥ�����߻��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore7" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">ָ���ⱻ��̨����Աɾ�����۳����֡�</span>
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>ɾ���𰸼�ȥ�ش��߻��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore8" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">ָ�ش�Ĵ𰸱������߻��ǻش����Լ�ɾ��ʱ���۳����֡�</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>ɾ����Ѵ𰸼�ȥ�ش��߻��֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore9" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">����̨����Աɾ������Ȩ��ɾ����Ѵ�</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>ɾ��δ��������ȥ���֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore10" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">ָ��Ա�ڻ�Ա����ɾ���Լ������⣬�۳����֡�</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>ɾ���ѽ�������ȥ���֣�</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore11" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> ��
                <span class="tips">ָ��Ա�ڻ�Ա����ɾ���Լ������⣬�۳����֡�</span>
            </td>
         </tr>


        </table>
      </div>
         
         
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">ģ���</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>Ƶ����ҳģ�壺</b>
             <div class="tips">��Ӧ��̬ҳ��Index.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AskIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.AskIndexTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/index.aspx" class="link-color" target="_blank">Ԥ��</a>
                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>�����б�ҳģ�壺</b>
             <div class="tips">��Ӧ��̬ҳ��List.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AskListTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.AskListTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/list.aspx" class="link-color" target="_blank">Ԥ��</a>
                </td>
         </tr>

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>������ϸҳģ�壺</b>
             <div class="tips">��Ӧ��̬ҳ��Question.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AskContentTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.AskContentTemplate.ClientID%>');"/>
                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>����ר��ҳģ�壺</b>
             <div class="tips">��Ӧ��̬ҳ��ZJ.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAskZJTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.TxtAskZJTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/zj.aspx" class="link-color" target="_blank">Ԥ��</a>

                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>����ҳģ�壺</b>
             <div class="tips">��Ӧ��̬ҳ��ask.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAskTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="ѡ��ģ��..." onClick="SelectTemplate('<%=this.TxtAskTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/ask.aspx" class="link-color" target="_blank">Ԥ��</a>
                </td>
         </tr>

          
    </table>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>�ʴ�Ƶ�����⣺</b><br /> <font class="tips">��ҳ����ͨ�������������ע���ص�,</font></td>
                                <td class="righttd">
                                    &nbsp;<asp:TextBox ID="TxtAskSeoTitle" runat="server" Columns="70" Rows="8" TextMode="MultiLine"></asp:TextBox>
                                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtAskSeoTitle.ClientID %>');"></a>
                                      <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtAskSeoTitle.ClientID %>');"></a>
                                </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>�ʴ�Ƶ��META�ؼ��ʣ�
                                     </strong><br />
                                     <font class="tips">
                                     ��������������õ���ҳ�ؼ���,����ؼ�������,�ŷָ�
                                     </font>
                                 </td>
                                 <td class="righttd">
                                     &nbsp;<asp:TextBox ID="TxtAskSeoKeywords" runat="server" TextMode="MultiLine" Columns="70" Rows="8"></asp:TextBox>
                                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtAskSeoKeywords.ClientID %>');"></a>
                                      <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtAskSeoKeywords.ClientID %>');"></a>

                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px">
                                     <div>
                                         <strong>�ʴ�Ƶ��META��ҳ������</strong></div>
                                      <font class="tips">��������������õ���ҳ����,�����������,�ŷָ�&nbsp;</font></td>
                                 <td class="righttd">
                                     &nbsp;<asp:TextBox ID="TxtAskSeoDescript" runat="server" TextMode="MultiLine" Columns="70" Rows="8"></asp:TextBox>
                                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtAskSeoDescript.ClientID %>');"></a>
                                      <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtAskSeoDescript.ClientID %>');"></a>
                               </td>
                             </tr>
              </table>

         </div>

    <KS:Foot runat="server" CancelButtonVisible="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/tipsico/" />
 </div>
        </div>
</asp:Content>

