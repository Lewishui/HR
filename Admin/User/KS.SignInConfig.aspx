<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="True" Inherits="Kesion.NET.WebSite.Admin_User_SignInConfig" Codebehind="KS.SignInConfig.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <KS:topnav id="TopNav1" runat="server" text="签到参数设置"></KS:topnav>
    <div class="content-area">			
    <table id="tbs" width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
             <td class="lefttd" height="30" align="right" style="width: 198px"><b>频道状态：</b></td>
                <td class="righttd">
                   <asp:RadioButtonList ID="SignStatus" runat="server" RepeatDirection="horizontal">
                        <asp:ListItem Value="1" Selected="True">正常</asp:ListItem>
                       <asp:ListItem Value="0">关闭</asp:ListItem>                
                    </asp:RadioButtonList>
                </td>
         </tr>
        <tr>
                <td align="right" class="lefttd" height="30" __designer:mapid="de">
                <strong>签到天数额外获得奖励：</strong></td>
                <td class="righttd" __designer:mapid="e0">
                <table border="0" cellpadding="0" cellspacing="0" class="sTable" style="" width="80%" __designer:mapid="e1">
     
                       <tr>
                  <td colspan="3" height="30px">                     
              <input name="vote_num" class="textbox" type="hidden" id="recordnum" value="1" size="5" style="text-align:center"> 
              <input type="button" name="Submit52" value="增加选项" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" onclick="javascript: doadd(jQuery('#recordnum').val());"> 
              <input name="editnum" type="hidden" id="editnum" value="<%=editnum %>">                  
                  </td>
                 </tr>
                <tr bgcolor='#DBEAF5' __designer:mapid="e5">
                <td width='8%' height='20'  style="text-align:center">编号</td>
                <td width='10%' style="text-align:center" __designer:mapid="e7"> 天数</td>
                <td width='10%'  style="text-align:center" __designer:mapid="e8">积分</td>
                <td width='100px'  style="text-align:center">操作</td>             
                 </tr>
                <tbody  id="addrecord" __designer:mapid="ea"><%=tableStr %></tbody>
                </table>                
                
                </td>
            </tr>
                
        <script>
            function doadd(num) {
                var i;
                var str = "";
                var oldi = 0;
                var j = 0;
                oldi = parseInt(jQuery('#editnum').val());
                for (i = 1; i <= num; i++) {
                    j = i + oldi;
                    str = str + "<tr id='tr" + j + "'><td width=5% height=20> <div align=center><input type=hidden name=id id='id' value=" + j + ">" + j + "</div></td><td width=20%> <div align=center><input type=text class=textbox name=days" + j + " size=20 style='width:50px;text-align:center' value=0></div></td><td width=10%> <div align=center><input type=text class=textbox name=money" + j + " size=5 style='width:50px;text-align:center' value=0></div></td><td> <div align=center ><a href='javascript:;' class='link-color' onClick='if (confirm(\"确认删除吗？\")){ del(" + j + "); }'>删除</a></div></td></tr>";
                }
                $("#addrecord").append(str);
                //indow.addvote.innerHTML+="<table width=100% border=0 cellspacing=1 cellpadding=3>"+str+"</table>";
                jQuery('#editnum').val(j);
            }
            function del(id) {
                $("#tr" + id).remove();
            }
    </script>
         <tr>
        <td align="right" class="lefttd" height="30" ><strong>领取数值类型：</strong></td>
         <td class="righttd">
             <asp:DropDownList ID="NumType" runat="server">  
                 <asp:ListItem Value="3" Selected>积分</asp:ListItem>
                 <asp:ListItem Value="1" >点</asp:ListItem>
                  <asp:ListItem Value="2" >元</asp:ListItem>                
             </asp:DropDownList>             
             <span>点数、资金和积分</span>
         </td>
     </tr>
      
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>每天领取分数：</strong></td>
            <td class="righttd">
                <asp:TextBox CssClass="textbox" Width="50px" ID="SignInOverNums" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px;display:none">
                <strong>平常积分兑换链接地址：</strong></td>
            <td class="righttd" style="display:none">
                <asp:TextBox CssClass="textbox" Width="300px" ID="SignInOverUrl" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px;display:none">
                <strong>每日奖励兑换链接地址：</strong></td>
            <td class="righttd" style="display:none">
                <asp:TextBox CssClass="textbox" Width="300px" ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px;display:none">
                <strong>周奖励兑换链接地址：</strong></td>
            <td class="righttd" style="display:none">
                <asp:TextBox CssClass="textbox" Width="300px" ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px;display:none">
                <strong>月奖励兑换链接地址：</strong></td>
            <td class="righttd" style="display:none">
                <asp:TextBox CssClass="textbox" Width="300px" ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px;display:none">
                <strong>月度牛人兑换链接地址：</strong></td>
            <td class="righttd" style="display:none">
                <asp:TextBox CssClass="textbox" Width="300px" ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>

          <tr>
              <td  height="30" align="right" class="lefttd" style="width: 198px">
               <b>签到规则说明：</b></td>
               <td class="righttd">
               <asp:TextBox ID="SignInRule" runat="server" Columns="70" Rows="6" TextMode="MultiLine"></asp:TextBox>
               <%--<a href="javascript:zoomtextarea(-5,'<%=this.SignInRule.ClientID %>');"><img src="../../admin/images//minus.gif" border="0" /></a>
               <a href="javascript:zoomtextarea(5,'<%=this.SignInRule.ClientID %>');"><img src="../../admin/images/plus.gif" border="0" style="color: #333333"/></a>--%>
                 <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.SignInRule.ClientID %>');"></a>
                <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.SignInRule.ClientID %>');"></a>
               </td>
         </tr>       
        
         </table>
         
    <KS:Foot runat="server" CancelButtonEnabled="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/" />
   </div>
</asp:Content>


