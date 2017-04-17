<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Ask_Rank" Title="�ʰɵȼ�����" Codebehind="KS.AskRank.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="ListPannel" runat="server" Width="100%">
 <div id="manage_top" class="menu_top_fixed"> 
   <ul>
         <li id="p1"><a href="?action=Add"><b></b>����µȼ�</a></li>
   </ul>
  </div>
 
 <div class="menu_top_fixed_height"></div> 
 <div class="content-area">
 	<div class="myTitle">�ʰɵȼ�����</div>
        <asp:GridView ID="RankList" cssclass="CTable"  runat="server" AutoGenerateColumns="False" EmptyDataText="��û������ʰɵȼ�!"
        GridLines="None" HorizontalAlign="Center" OnRowDataBound="List_RowDataBound"
        Width="99%" OnRowCommand="RankList_RowCommand" OnRowCreated="RankList_RowCreated">
        <EmptyDataRowStyle CssClass="emptycss" />
        <Columns>
            
            
             <asp:TemplateField HeaderText="�ȼ�ID" InsertVisible="False">   
            <ItemStyle HorizontalAlign="Center" Width="60px" />                    
                <ItemTemplate>    
                    <%# Eval("RankID") %> 
                    <asp:HiddenField ID="HidIsSys" runat="server" Value='<%# Eval("IsSys") %>' />      
                </ItemTemplate>             
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="�ȼ�����">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" Width="100" ID="TxtRankName" Text='<%#Eval("RankName") %>' runat="server"></asp:TextBox>
             </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="�ȼ�ͼ��">
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtIco"  Width="100" Text='<%#Eval("Ico") %>' runat="server"></asp:TextBox>
              <img src="../../sysimg/rank/<%# Eval("ico") %>" />
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="��ɫֵ">
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtColor"  Width="60" Text='<%#Eval("Color") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�������">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtScore" Width="40" Text='<%#Eval("Score") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="������">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtQueNum"  Width="40" Text='<%#Eval("QueNum") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�ش���">
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
              <asp:TextBox CssClass="textbox" ID="TxtAnsNum"   Width="40" Text='<%#Eval("AnsNum") %>' runat="server"></asp:TextBox>
             </ItemTemplate> 
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="delete" ToolTip="ɾ��" ID="lkbDelete" CommandName="dodel" CommandArgument='<%#Eval("RankID") %>' runat="server"></asp:LinkButton>
                        </itemtemplate>
               </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
    </asp:GridView>
    
    <div style="display:none">

     <KS:Page ID="Page1" runat="server" /></div>
    <br />
    <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" CancelButtonVisible="false" SubmitButtonText="��������(0)" />
    <br />
     <script type="text/javascript">
               showtips(' <span class="state"><strong>˵����</strong><br /></span>1���ȼ�ͼ����ŵ�/sysimg/rank/Ŀ¼�£�<br/>2��Ӧ�þ�����Ҫɾ������ӵĵȼ�;<br/>3���ȼ��ߵ��������󣬼����ȼ�ID�ŴӵͶ��ߡ�');
	 </script>

</asp:Panel>
</div>
<asp:Panel ID="PanAdd" runat="server" Visible="false">
<KS:TopNav ID="TopNav1" runat="server" Text="����ʴ�ȼ�" />
<div class="content-area">
        <table width="99%" style="margin:0 auto;" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ȼ����ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtRankName" runat="server"></asp:TextBox> <font color=#ff0000>*</font>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ȼ�ͼ�꣺</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtIco" Text="rank0.gif" runat="server"></asp:TextBox> 
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�ȼ���ɫ��</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TxtColor"  runat="server"></asp:TextBox> <span class="tips">����д��ɫֵ����#666666,�������ղ��</span>
              </td>
          </tr>
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>�������õȼ���������</b></td>
            <td class="righttd">
                &nbsp;���֣�<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtScore" Text="0" runat="server"></asp:TextBox> 
                &nbsp;��������<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtQueNum" Text="0" runat="server"></asp:TextBox> 
                &nbsp;�ش�����<asp:TextBox CssClass="textbox" Width="50px" style="text-align:center" ID="TxtAnsNum" Text="0" runat="server"></asp:TextBox> 
              </td>
          </tr>

       </table>

    <KS:Foot ID="Foot2" runat="server" OnSubmit="Foot2_Submit" SubmitButtonText="ȷ������(0)" />
</asp:Panel>
</div>

</asp:Content>

