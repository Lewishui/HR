<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskConfig" Title="问答系统参数设置" Codebehind="KS.AskConfig.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <KS:topnav id="TopNav1" runat="server" text="问答系统频道参数设置"></KS:topnav>
    <div class="content-area">
    
		<div class="tab-page" id="SystemAskPanel">
         <script type="text/javascript">
           var tabPane1 = new WebFXTabPane( document.getElementById( "SystemAskPanel" ), 1 )
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">基本参数</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
    <table id="tbs" width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>问答频道状态：</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="AskStatus" runat="server" RepeatDirection="horizontal">
                    <asp:ListItem Value="0">关闭</asp:ListItem>
                    <asp:ListItem Value="1" Selected>正常</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
         </tr>
          <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>问答频道名称：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtAskName" runat="server"></asp:TextBox>
                <span class="tips">如问答频道。</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>前台安装目录：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="AskInstallDir" runat="server"></asp:TextBox>
                <span class="tips">如WenDa,Ask等</span></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>绑定二级域名：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" ID="TxtAskDomain" runat="server"></asp:TextBox>
              <span class="tips">如：http://Ask.kesion.com，后面不能加"/"，没有绑定二级域名请留空。</span>
                </td>
        </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>提问题是否需要审核：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskPubVefifyTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不需要审核,直接发布</asp:ListItem>
                <asp:ListItem Value="1">需要后台审核后,方可发布</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>每个会员每天最多可以提问：</strong></td>
            <td class="righttd">
                <asp:TextBox ID="TxtLimitPostNum" runat="server" Text="0" CssClass="textbox" Width="50px" style="text-align:center"></asp:TextBox>
                个问题
                <span class="tips">TIPS:如果不限制请输入“0”。</span>
            </td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>回答问题是否需要审核：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskReplyVerifyTF" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0">不需要审核</asp:ListItem>
                <asp:ListItem Value="1">需要审核</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>是否允许游客提问：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许（建议）</asp:ListItem>
                <asp:ListItem Value="1">允许</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>是否允许游客回答：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskReplyVisitorTF" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许（建议）</asp:ListItem>
                <asp:ListItem Value="1">允许</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>提问人可以删除自已的问题：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="RdbDelTopic" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许</asp:ListItem>
                <asp:ListItem Value="1">仅删除未解决的问题</asp:ListItem>
                <asp:ListItem Value="2">允许删除所有问题</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>可以删除回答者的答案：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskDelAnswer" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许</asp:ListItem>
                <asp:ListItem Value="1">仅提问人可以删除用户的答案</asp:ListItem>
                <asp:ListItem Value="2">回答者可以删除自己的答案</asp:ListItem>
                <asp:ListItem Value="3">提问者和回答者都可以删除答案</asp:ListItem>
                </asp:RadioButtonList>
                <span class="tips">TIPS：最佳答案不能删除。</span>
                </td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>提问人可以回答自己提问的问题：</strong></td>
            <td class="righttd">
                <asp:RadioButtonList ID="AskAnswerOwnQuestion" runat="server" RepeatDirection="horizontal">
                <asp:ListItem Value="0">不允许</asp:ListItem>
                <asp:ListItem Value="1">允许</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
       <tr>
           <td align="right" class="lefttd" height="30" style="width: 227px">
                          <strong>允许回答问题的用户组：</strong>
                 <div class="tips">TIPS:不限制请不要勾选。</div>
             </td>
             <td class="righttd" ID="ViewGroupIDArea" runat="server">
                </td>
          </tr>
         </table>
    </div>
         
         
          
         
		 <div class="tab-page" id="tab3">
		  <h2 class="tab">积分设置</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab3"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>用户回答一个问题所得的积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore1" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">同一个问题回只赠送积分一次，如果设置答案需要审核，则需要管理员审核通过才赠送积分。</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>回答被提问者采纳所额外奖励的积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore2" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>用户处理问题所得的积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore3" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
            <span class="tips">指提问者设置最佳答案的操作。</span></td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>问题被选为精彩推荐提问者所得的积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore4" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>问题被选为精彩推荐最佳回答者所得的积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore5" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>用户发表一个问题所获的积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore6" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">设置成负数则表示提问题要消费,当设置需要审核则只有后台审核通过才赠送积分。</span>
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>问题被删除减去提问者积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore7" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">指问题被后台管理员删除，扣除积分。</span>
            </td>
         </tr>

         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>删除答案减去回答者积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore8" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">指回答的答案被提问者或是回答者自己删除时，扣除积分。</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>删除最佳答案减去回答者积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore9" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">仅后台管理员删除才有权限删除最佳答案</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>删除未解决问题减去积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore10" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">指会员在会员中心删除自己的问题，扣除积分。</span>
            </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>删除已解决问题减去积分：</b>
             <div style="color:green"></div>
             </td>
             <td class="righttd">
                <asp:TextBox ID="TxtAskScore11" CssClass="textbox" runat="server" Width="50px" style="text-align:center"/> 分
                <span class="tips">指会员在会员中心删除自己的问题，扣除积分。</span>
            </td>
         </tr>


        </table>
      </div>
         
         
         
		 <div class="tab-page" id="tab2">
		  <h2 class="tab">模板绑定</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>频道首页模板：</b>
             <div class="tips">对应动态页面Index.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AskIndexTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.AskIndexTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/index.aspx" class="link-color" target="_blank">预览</a>
                </td>
         </tr>
          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>分类列表页模板：</b>
             <div class="tips">对应动态页面List.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AskListTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.AskListTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/list.aspx" class="link-color" target="_blank">预览</a>
                </td>
         </tr>

          
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>内容详细页模板：</b>
             <div class="tips">对应动态页面Question.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="AskContentTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.AskContentTemplate.ClientID%>');"/>
                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>所有专家页模板：</b>
             <div class="tips">对应动态页面ZJ.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAskZJTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtAskZJTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/zj.aspx" class="link-color" target="_blank">预览</a>

                </td>
         </tr>
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>提问页模板：</b>
             <div class="tips">对应动态页面ask.aspx</div>
             </td>
                <td class="righttd">
                    &nbsp;<asp:TextBox CssClass="textbox" ID="TxtAskTemplate" runat="server" Width="297px"></asp:TextBox>
                    <input type="button" class="button" onMouseOver="this.className='button_on';" onMouseOut="this.className='button';" value="选择模板..." onClick="SelectTemplate('<%=this.TxtAskTemplate.ClientID%>');"/>
                    <a href="../../<%=this.AskInstallDir.Text %>/ask.aspx" class="link-color" target="_blank">预览</a>
                </td>
         </tr>

          
    </table>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">SEO选项</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             <table width="100%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                              <tr>
                                <td  height="30" align="right" class="lefttd" style="width: 198px">
                                    <b>问答频道标题：</b><br /> <font class="tips">网页标题通常是搜索引擎关注的重点,</font></td>
                                <td class="righttd">
                                    &nbsp;<asp:TextBox ID="TxtAskSeoTitle" runat="server" Columns="70" Rows="8" TextMode="MultiLine"></asp:TextBox>
                                      <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.TxtAskSeoTitle.ClientID %>');"></a>
                                      <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.TxtAskSeoTitle.ClientID %>');"></a>
                                </td>
                              </tr>

                             <tr>
                                 <td align="right" class="lefttd" height="30" style="width: 198px"><strong>问答频道META关键词：
                                     </strong><br />
                                     <font class="tips">
                                     针对搜索引擎设置的网页关键词,多个关键词请用,号分隔
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
                                         <strong>问答频道META网页描述：</strong></div>
                                      <font class="tips">针对搜索引擎设置的网页描述,多个描述请用,号分隔&nbsp;</font></td>
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

