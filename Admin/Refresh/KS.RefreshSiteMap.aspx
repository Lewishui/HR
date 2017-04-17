<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Refresh_RefreshSiteMap" Title="Untitled Page" Codebehind="KS.RefreshSiteMap.aspx.cs" %>
<%@ Register Src="~/control/refresh/RefreshTopControl.ascx" TagName="RefreshTopNav" TagPrefix="uc1" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<uc1:RefreshTopNav ID="RefreshTopNavS1" runat="server"/>
   <div class="content-area">         
     <span style="display:none">
          <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td height="25" style="text-align: left;">
                        <strong>Google��ͼ���ɲ���</strong><span class="tips">(���ɷ���GOOGLE�淶��XML��ʽ��ͼҳ��)</span></td>
                </tr>

                <tr class="lefttd">
                    <td align="right" style="text-align: left; height: 30px;padding:10px;line-height:30px; width: 751px;">
                     ����Ƶ�ʣ�<asp:DropDownList ID="DrpChangeFreq" runat="server">
                             <asp:ListItem Value="always">Ƶ���ĸ���</asp:ListItem>
                             <asp:ListItem Value="hourly">ÿСʱ����</asp:ListItem>
                             <asp:ListItem Value="daily" Selected="true">ÿ�ո���</asp:ListItem>
                             <asp:ListItem Value="weekly">ÿ�ܸ���</asp:ListItem>
                             <asp:ListItem Value="monthly">ÿ�¸���</asp:ListItem>
                             <asp:ListItem Value="yearly">ÿ�����</asp:ListItem>
                             <asp:ListItem Value="never">�Ӳ�����</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        ������Ϣ������<asp:TextBox  CssClass="textbox" ID="TxtNum" runat="server" Width="50px">100</asp:TextBox>��<br />
                        ע �� �ȣ�<asp:TextBox  CssClass="textbox" ID="TxtBig" runat="server" Width="50px">0.5</asp:TextBox>0-1.0֮��,�Ƽ�ʹ��Ĭ��ֵ</td>
                </tr>
          </table>
              <asp:PlaceHolder ID="PlaceHolder1" runat="server"><asp:Button ID="Button1" runat="server" CssClass="button" Text="��ʼ����Google��ͼ" OnClick="Button1_Click" /></asp:PlaceHolder>     
     </span>   
    
                <div style="text-align:center;margin:5px">
      
        <br />
        <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td  colspan="2" height="25" style="text-align: left; ">
                        <strong>360����/�ٶ�����Sitemap���ɲ���</strong><span class="tips">(���ɷ���<a href="http://zhanzhang.baidu.com/wiki/93" target="_blank">�ٶ�Sitemap</a>��<a href="http://www.haosou.com/help/help_3_3.html#sitemapdata" target="_blank">360����Sitemap</a>��ʽ����վ��ͼ)</span></td>
                </tr>
            <tr>
                    <td align="right"  class="lefttd">����ģ�飺</td>
                    <td align="left">
                        <asp:RadioButtonList ID="RdbModelType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0" Selected="True">����ģ��</asp:ListItem>
                            <asp:ListItem Value="1">�̳�ģ��</asp:ListItem>
                            <asp:ListItem Value="2">�̳�+����</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td align="right"  class="lefttd">�����ĵ�����</td>
                    <td align="left">
                         <asp:TextBox  CssClass="textbox" ID="TxtNum2" runat="server" Width="80px" style="text-align:center">10000</asp:TextBox>�� <span class="tips">(������50000��)</span>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="lefttd">���ɸ�ʽ��</td>
                    <td align="left">
                        <asp:RadioButtonList ID="RdbFsoType2" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem Value="0" Selected="True">Txt��ʽ</asp:ListItem>
                            <asp:ListItem Value="1">Xml��ʽ</asp:ListItem>
                             </asp:RadioButtonList>
                    </td>
                </tr>
               <tr>
                    <td align="right"  class="lefttd">�����ļ�����</td>
                    <td align="left">
                         <asp:TextBox  CssClass="textbox" ID="TxtFileName2" runat="server" Width="250px">Sitemap</asp:TextBox> <span class="tips">�磺sitemap,news�ȡ�</span>
                    </td>
                </tr>
          </table>
        </div>
          <div style="padding-left:140px;margin:35px">
          <asp:PlaceHolder ID="PlaceHolder2" runat="server">
            <asp:Button ID="Button2" runat="server" CssClass="button" Text="��ʼ����360����/�ٶ�����Sitemap" OnClick="Button2_Click" />
            </asp:PlaceHolder>
        </div>
        <br />
     <br />
        <table width="99%"  border="0" cellpadding="1" cellspacing="1" class="CTable"> 
                <tr>
                    <td  colspan="2" height="25" style="text-align: left; ">
                        <strong>�ٶ���������</strong><span class="tips"></span></td>
                </tr>
                <tr>
                    <td align="right"  class="lefttd">�����ύ�ĵ�����</td>
                    <td align="left">
                         <asp:TextBox  CssClass="textbox" ID="TxtPostBaiduNum" runat="server" Width="80px" style="text-align:center">500</asp:TextBox>�� <span class="tips">(���������ĵ��� <font color=red><strong><%=Kesion.BLL.DataFactory.GetOnlyValue("select count(1) From KS_InfoList Where Verify=1 and day(adddate)="+DateTime.Now.Day+" and month(adddate)="+DateTime.Now.Month+" and year(adddate)="+DateTime.Now.Year) %> </strong></font>ƪ��)</span>
                    </td>
                </tr>
                <tr>
                    <td align="right"  class="lefttd">�ٶ���������URL��</td>
                    <td align="left">
                         <asp:TextBox  CssClass="textbox" ID="TxtBaiDuUrl" runat="server" Width="480px">http://data.zz.baidu.com/urls?site=www.kesion.com&token=v1O9bO0ZWhtekz9l</asp:TextBox>
                        <br /> <span class="tips">(�磺http://data.zz.baidu.com/urls?site=www.kesion.com&token=v1O9bO0ZWhtekz9l���������¼��<a href='http://zhanzhang.baidu.com/linksubmit/index?site=<%=MyCache.GetCacheConfig(5) %>' target="_blank">http://zhanzhang.baidu.com/linksubmit/index?site=<%=MyCache.GetCacheConfig(5) %></a>���鿴��)</span>
                    </td>
                </tr>
               
          </table>
        
          <div style="padding-left:140px;margin:35px">
            <asp:Button ID="Button3" runat="server" CssClass="button" Text="��ʼ�������͸��ٶ�" OnClick="Button3_Click"/>
        </div>
    </div>    

</div>
    
</asp:Content>

