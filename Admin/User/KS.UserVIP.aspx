<%@ Page Language="C#"  MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.Admin.User.KS_UserVIP" Codebehind="KS.UserVIP.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <KS:topnav id="TopNav1" runat="server" text="VIP有效期购买设置"></KS:topnav>
    <div class="content-area">			
    <table id="tbs" width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
         <tr>
                <td align="right" class="lefttd" height="30" style="width: 218px" __designer:mapid="de">
                <strong>充值金额及对应VIP天数：</strong></td>
                <td class="righttd" __designer:mapid="e0">
                <table border="0" cellpadding="0" cellspacing="0" class="sTable" style="" width="80%" __designer:mapid="e1">
     
                       <tr>
                  <td colspan="3" height="30px">
              <input type="button" name="Submit52" value="增加选项" class="button" onmouseover="this.className='button_on';" onmouseout="this.className='button';" onclick="javascript: doadd(1);"> 
              <input name="editnum" type="hidden" id="editnum" value="<%=editnum %>">                  
                  </td>
                 </tr>
                 <tr bgcolor='#DBEAF5'>
                <td width='8%' height='20'  style="text-align:center">编号</td>
                 <td width='10%' style="text-align:center"> 天数</td>
                     <td width='10%'  style="text-align:center">金额</td>   
                      <td  style="width:100px;text-align:center">操作</td>              
                 </tr>
                <tbody  id="addrecord"><%=tableStr %></tbody>
                </table>
                
                </td>
            </tr>
         <tr>

        </tr>  

          <tr>
            <td align="right" class="lefttd"  style="width: 218px">
                <strong>VIP充值介绍：</strong>
            </td>
            <td class="righttd">
                <asp:TextBox ID="intro"  Width="98%" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>                          
                 <% Kesion.APPCode.EditorAPI.EchoEditor("editor",this.intro.ClientID,"Basic");%>
            </td>
        </tr>  

            
         </table>
  <script>
      function doadd(num) {
          var i;
          var str = "";
          var oldi = 0;
          var j = 0;
          oldi = parseInt(jQuery('#editnum').val());
          for (i = 1; i <= num; i++) {
              j = i + oldi;
              str = str + "<tr id='tr" + j + "'><td width=5% height=20> <div align=center><input type=hidden name=id id='id' value=" + j + ">" + j + "</div></td><td width=20%> <div align=center><input type=text class=textbox name=days" + j + " size=20 style='width:50px;text-align:center' value=0></div></td><td width=10%> <div align=center><input type=text class=textbox name=money" + j + " size=5 style='width:50px;text-align:center' value=0></div></td><td> <div align=center ><a href='javascript:;' class='btn btn-default' onClick='if (confirm(\"确认删除吗？\")){ del("+j+"); }'>删除</a></div></td></tr>";
          }
          $("#addrecord").append(str);
          jQuery('#editnum').val(j);
      }
      function del(id) {
         $("#tr" + id).remove();
      }
    </script>

    <KS:Foot runat="server" CancelButtonEnabled="false" ID="Foot1" OnSubmit="Foot1_Submit"/>
    <KS:Tips ID="Tips1" runat="server" ImagePath="../../admin/images/" />

</div>

</asp:Content>