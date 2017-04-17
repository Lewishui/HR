<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskAnswer" Title="回答管理" Codebehind="KS.AskAnswer.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="toptitle menu_top_fixed" style="text-align:left">
    <div class="quickSelect">
            <asp:DropDownList ID="DrpClassID1" runat="server" onchange="location.href='?classid='+this.value;">
             <asp:ListItem Value="0">--按分类查看--</asp:ListItem>
             </asp:DropDownList>
          </div>
    
     当前数据表：<asp:DropDownList ID="DrpPostTable" runat="server"></asp:DropDownList>
    </div>  
    <div class="menu_top_fixed_height"></div> 
    <div class="content-area">
    
    <script>
        function changeTable(v) {
            location.href = "KS.AskAnswer.Aspx?showType=<%=KSCMS.S("showType")%>&postTable=" + v;
        }
    </script>    
        

        <!--<asp:Label ID="LabNav" runat="server"></asp:Label>-->
    <div class="myTitle">
		审核问题的回答
        <div class="quickSearch">
            搜索回答：<asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 
            </asp:DropDownList>
            <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="开始搜索" 
                    onclick="BtnSearch_Click"  />
        </div>
     </div>   
       
 <div class="tabs_header">
    <ul class="tabs">
    <li<%=KSCMS.S("showType")==""||KSCMS.S("showType")=="0"?" class='active'":string.Empty %>>
        <a href="KS.AskAnswer.Aspx?showType=0&<%=UtilsQueryParam.Get("showType")%>"><span>所有答案</span></a></li>
    <li<%=KSCMS.S("showType")=="1"?" class='active'":string.Empty %>>
        <a href="KS.AskAnswer.Aspx?showType=1&<%=UtilsQueryParam.Get("showType") %>">
        <span>未审核的答案</span></a></li>
    <li<%=KSCMS.S("showType")=="2"?" class='active'":string.Empty %>>
        <a href="KS.AskAnswer.Aspx?showType=2&<%=UtilsQueryParam.Get("showType")%>">
        <span>已审核的答案</span></a></li>
    <li<%=KSCMS.S("showType")=="3"?" class='active'":string.Empty %>>
        <a href="KS.AskAnswer.Aspx?showType=3&<%=UtilsQueryParam.Get("showType")%>">
        <span>最佳答案</span></a></li>
    
    </ul></div><KS:ksgv id="list" cssclass="CTable" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="没有任何答案!" PagerType="CustomNumeric" Width="99%" 
            GridLines="None" OnRowCommand="List_RowCommand" 
            OnRowCreated="List_RowCreated" onrowdatabound="list_RowDataBound">
        <Columns>

         <asp:TemplateField HeaderText="选择">
                <itemstyle horizontalalign="Center" Height="30px" width="30px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("postid") %>" /></itemtemplate></asp:TemplateField>
            
             <asp:TemplateField HeaderText="状态">
              <itemstyle width="30px" horizontalalign="Center"/>
              <itemtemplate>
                   <a href="?action=verify&postTable=<%=postTable %>&ids=<%# Eval("postId") %>" <%# Convert.ToString(Eval("verify"))=="0"?"class='no' title='未审核'":"class='ok' title='已审核'" %>></a>
              </itemtemplate>
            </asp:TemplateField>
           
            
            <asp:TemplateField HeaderText="问题">
                <itemtemplate>
                <a href="../../<%=MyCache.GetAskCacheConfig(1) %>/Question.aspx?id=<%# Eval("topicid") %>" target="_blank"><span class="doc_1"></span></a>
               
                <a href="../../<%=MyCache.GetAskCacheConfig(1) %>/Question.aspx?id=<%# Eval("topicid") %>" target="_blank" title="<%# Eval("Title") %>"><%# Utils.CutStr(Convert.ToString(Eval("title")),30) %></a>
               <%# Convert.ToInt16(Eval("IsBest"))==1?"<span style='color:red'>最佳</span>":string.Empty %>
                </itemtemplate>
                
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="答案">
                <itemstyle horizontalalign="Left" />
                <itemtemplate>
                <%# Utils.CutStr(Convert.ToString(Eval("Content")), 30)%>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="回答者" DataField="username">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="回答时间" DataField="adddate">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>

             <asp:TemplateField HeaderText="编辑">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                          <asp:LinkButton CssClass="edit" ToolTip="编辑" ID="LinkButton1" runat="server" commandargument=<%#Eval("postid") %> commandname="modify"></asp:LinkButton>
                        </itemtemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="删除">
                <itemstyle horizontalalign="Center" width="25px"/>
                 <itemtemplate>
                 <asp:LinkButton CssClass="delete" ToolTip="删除" runat="server" id="delete" commandargument=<%#Eval("postid") %> commandname="del"></asp:LinkButton></itemtemplate>
             </asp:TemplateField>

        </Columns><HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
    </KS:ksgv>
    
        <asp:Panel ID="Panel2" runat="server" Height="30px" Width="741px">
          <div style="margin-top:8px"></div>
            &nbsp;&nbsp;<input type="checkbox" name="chkall" id="chkall" onclick="CheckAll(this.form);"/><label for="chkall">全部选中</label>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="删除记录" onmouseover="this.className='button_on';" onmouseout="this.className='button';" class="button" onclick="if (GetIDS('del')){this.form.action='?action=del';this.form.submit()}" />
           
            <asp:Button 
                ID="BtnVerify" runat="server" Text="批量审核" CssClass="button" 
                onclick="BtnVerify_Click"/> <asp:Button ID="BtnUnVerity" runat="server" CssClass="button" 
             Text="取消审核" onclick="BtnUnVerity_Click"/>
      </asp:Panel>
      
            
     <KS:Page ID="Page1" runat="server" />
    
     

</asp:Panel>

</div>
     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="修改回答" />
    <div class="content-area">
    
  <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 


        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>回答：</strong></td>
                <td class="righttd">&nbsp;<asp:TextBox ID="TxtContent" TextMode="MultiLine" CssClass="textbox" Width="600px" Height="200px" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" class="lefttd" height="30" style="width: 102px">
                <strong>状态：</strong></td>
                <td class="righttd">&nbsp;
                <asp:RadioButtonList ID="RdbVerify" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                 <asp:ListItem Value="0">未审核</asp:ListItem>
                 <asp:ListItem Value="1">已审核</asp:ListItem>
                </asp:RadioButtonList>
                
                </td>
        </tr>
        </table>
      
      

      <div style="clear:both;text-align:center" class="main-button">
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>
        <script>
            function CheckForm() {
                if (jQuery('#<%=this.TxtContent.ClientID %>').val() == '') {
                    KesionJS.Alert('回答必须输入!', "jQuery('#<%=this.TxtContent.ClientID %>').focus()");
                    return false;
                }
                return true;
            }

    </script>
  </div>
</asp:Content>
