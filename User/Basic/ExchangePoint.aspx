<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_ExchangePoint" Title="����֧��" Codebehind="ExchangePoint.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

	<div class="r_tybox nomar">


   		<div class="tabs">	
			<ul>
				<li<%=KSCMS.S("flag")==""?" class='puton'":"" %>><a href="ExchangePoint.aspx">Ԥ�ƿ�һ�<%=MyCache.GetCacheConfig(49) %></a></li>
				 <%if (Utils.StrToInt(__configinfo.ScoreToPointRate.ToString()) > 0)
            { %>
				<li<%=KSCMS.S("flag")=="score"?" class='puton'":"" %>><a href="ExchangePoint.aspx?flag=score">���ֶһ�<%=MyCache.GetCacheConfig(49)%></a></li>
				<%} %>
			</ul>
		</div>
		<div class="r_padbox">
		<asp:Panel ID="MoneyPanel" runat="server" Width="100%">
        	<div class="padtitle" style="padding-left:0px;border-bottom:0px;"><a href="/user/PayOnline.aspx" class="hrefbtn">�ڴ˳�ֵԤ����</a></div>
             <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">

                 <tr class="tdbg">
                     <td style="height:50px; text-align:left; line-height:34px;" class="splittd">
                          ����,<%=__info.UserName%> !������ݼ���<%=UserGroupManage.GetUserGroupInfo(__info.GroupID).GroupName %>,
                         <br />����Ԥ��� <%=MyCache.GetCurrencySymbol %><font color=red><%=__info.Money %></font> <%=MyCache.GetCurrencyUnit %>(<a href="LogMoney.aspx"><span style="color:#3ba53d;">��ϸ</span></a>) ��
                         <br />����<%=MyCache.GetCacheConfig(49)%><%=__info.Point %><%=MyCache.GetCacheConfig(50) %>(<a href="Consumer.aspx"><span style="color:#3ba53d;">��ϸ</span></a>)
                         <br />�ۼƻ���<font color=#888><%=__info.Score %></font> �� ���û���<font color=green><%=__info.AvailableScore %></font>��(<a href="LogScore.aspx"><span style="color:#3ba53d;">��ϸ</span></a>)��
                         </td>
                 </tr>
                 <tr class="tdbg">
                     <td class="splittd" style="height:50px; text-align:left;border-bottom:0px; font-size:12px">
                        <span class="tips" style="padding-left:0px">�һ����ʣ�1<%=MyCache.GetCurrencyUnit %>�һ�1<%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>������ǰ����Ԥ�ƿ�Ϊ<%=__info.Money.ToString() %>Ԫ���������Զһ�<%=__info.Money.ToString("0") %><%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>��
                        </span><Br />&nbsp;�һ��� <asp:TextBox ID="TxtPoint" CssClass="textbox" style="text-align:center; padding-left:0px" runat="server" Width="50px" Text="100"></asp:TextBox> &nbsp;<%=MyCache.GetCacheConfig(50)%><%=MyCache.GetCacheConfig(49)%>
                       &nbsp; <asp:Button ID="BtnNext" runat="server" CssClass="button" Text="ȷ���һ�" OnClientClick="return(confirm('�˲��������棬ȷ��ִ�жһ���'));" OnClick="BtnNext_Click" />
                         <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtPoint" Operator="dataTypeCheck" Type="double" runat="server" ErrorMessage="��������ȷ������!"></asp:CompareValidator>
                     
                     <br />
                     
                     </td>
                 </tr>
                </table>
                
    		</div>
    	</div>
  
    </asp:Panel>

	<asp:Panel ID="ScorePanel" runat="server" Visible="false" Width="100%">
	
    	<div class="padtitle">ʹ���û��ֶһ�<%=MyCache.GetCacheConfig(49) %></div>
             <table  cellspacing="1" cellpadding="3" class="border" width="100%" align="center" border="0">
	             
                 <tr class="tdbg">
                     <td style="height:50px; font-size:14px; line-height:30px; text-align:left" class="splittd">
                          ����,<%=__info.UserName%> !������ݼ���<%=UserGroupManage.GetUserGroupInfo(__info.GroupID).GroupName %>,
                         <br />����Ԥ��� <%=MyCache.GetCurrencySymbol %><font color=red><%=__info.Money %></font> <%=MyCache.GetCurrencyUnit %>(<a href="LogMoney.aspx"><span style="color:blue;">��ϸ</span></a>)��
                         <br />����<%=MyCache.GetCacheConfig(49)%><%=__info.Point %><%=MyCache.GetCacheConfig(50) %>(<a href="Consumer.aspx"><span style="color:blue;">��ϸ</span></a>)
                         <br />�ۼƻ���<font color=#888><%=__info.Score %></font> �� ���û���<font color=green><%=__info.AvailableScore %></font>��(<a href="LogScore.aspx"><span style="color:blue;">��ϸ</span></a>)��
                         </td>
                 </tr>
                 <tr class="tdbg">
                     <td class="splittd" style="height:50px; text-align:left;border-bottom:0px; font-size:12px">
                        <span class="tips" style="padding-left:0px">�һ����ʣ�<%=__configinfo.ScoreToPointRate %>�����ֶһ�1<%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>������ǰ���û���Ϊ<%=__info.Score.ToString() %>Ԫ���������Զһ�<%=PointScore %><%=MyCache.GetCacheConfig(50) %><%=MyCache.GetCacheConfig(49) %>��
                        </span><Br />&nbsp;
                        �һ��� <asp:TextBox ID="TxtScorePoint" CssClass="textbox" style="text-align:center; padding-left:0px" runat="server" Width="50px" Text="100"></asp:TextBox> &nbsp;<%=MyCache.GetCacheConfig(50)%><%=MyCache.GetCacheConfig(49)%>
                       &nbsp; <asp:Button ID="Button1" runat="server" CssClass="button" Text="ȷ���һ�" 
                             OnClientClick="return(confirm('�˲��������棬ȷ��ִ�жһ���'));" onclick="Button1_Click"/>
                         <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TxtScorePoint" Operator="dataTypeCheck" Type="double" runat="server" ErrorMessage="��������ȷ������!"></asp:CompareValidator>
                     
                     <br />
                     
                     </td>
                 </tr>
            </table>
    
   
    </asp:Panel>

    

</asp:Content>

