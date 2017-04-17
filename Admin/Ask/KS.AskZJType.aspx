<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskZJType" Title="ר�ҷ������" Codebehind="KS.AskZJType.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="ListPanel" runat="server" Width="100%">
    <div id="manage_top" class="menu_top_fixed">
         <ul>
           <li id='p1'><asp:LinkButton ID="addclassbutton" runat="server" OnClick="addclassbutton_Click"><b></b>���ר�����</asp:LinkButton></li>
           <li id='p4'><asp:LinkButton ID="editclassbutton" runat="server" OnClick="editclassbutton_Click"><b></b>�༭ר�����</asp:LinkButton></li>
           <li id='p3'><asp:LinkButton ID="delclassbutton" runat="server" OnClick="delclassbutton_Click"><b></b>ɾ��ר�����</asp:LinkButton></li></ul>
    </div>  
   <div class="menu_top_fixed_height"></div>      
   <div class="content-area"> 

 <div class="tabs_header">
    <ul class="tabs">
    <li><a href="KS.AskCategory.aspx"><span>�ʰ��������</span></a></li>
    <li class='active'><a href="KS.AskZJType.aspx"><span>�ʰ�ר�ҷ���</span></a></li>
    </ul>
 </div>
    <KS:ksgv id="List" cssclass="CTable" runat="server" AutoGenerateColumns="False" EmptyDataText="û������κ�ר�����!" PagerType="CustomNumeric" Width="99%" HorizontalAlign="Center" GridLines="None" OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" OnRowCreated="List_RowCreated">
        <Columns>
         <asp:TemplateField HeaderText="ѡ��">
                <itemstyle horizontalalign="Center" Height="30px" width="50px" />
                <itemtemplate>
                <input type="checkbox"  name="ids" id="ids" value="<%#Eval("typeid") %>" />
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="���ID" DataField="TypeID" >
                <itemstyle width="50px" horizontalalign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="�������" DataField="TypeName" HtmlEncode="False" >
                <itemstyle  width="150px"  verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:BoundField HeaderText="�������" DataField="OrderID">
                <itemstyle verticalalign="Middle"  horizontalalign="Center"/>
            </asp:BoundField>
            <asp:TemplateField HeaderText="�༭">
                  <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                         <asp:LinkButton CssClass="edit" ToolTip="�༭" ID="LinkButton1" runat="server" commandargument=<%#Eval("typeid") %> commandname="modify"></asp:LinkButton>
                  </itemtemplate>
              </asp:TemplateField>
            <asp:TemplateField HeaderText="ɾ��">
                <itemstyle horizontalalign="Center" width="25px"/>
             <itemtemplate>
             
             <asp:LinkButton runat="server" CssClass="delete" ToolTip="ɾ��" id="delete" commandargument=<%#Eval("typeid") %> commandname="del"></asp:LinkButton>
            
            
</itemtemplate>
           
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="CTitle" />
        <EmptyDataRowStyle CssClass="emptycss" />
       
    </KS:ksgv>
    
     <KS:Page ID="Page1" runat="server" />
                <asp:Panel ID="Panel1" runat="server" Height="30px" Width="100%">
                <br />
        <script type="text/javascript">
		showtips('<span class="state"><strong>����˵����</strong><br /></span>ר�����һ�����������龡���ٸĶ�����ò�Ҫɾ���������⵼��ר����������޷�������');
		</script>

            </asp:Panel>
</asp:Panel>
</div>

     
    <asp:Panel ID="AddPanel" runat="server"  Width="100%" Visible="false">
    <KS:TopNav ID="TopNav1" runat="server" Text="���ר�����" />
    <div class="content-area">
    <table width="99%" align="center" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
          <tr>
            <td class="lefttd" height="30" align="right" style="width: 198px"><b>ר��������ƣ�</b></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="TypeName" runat="server" Width="203px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TypeName"
                    ErrorMessage="����дר���������!" Display="Dynamic"></asp:RequiredFieldValidator> <span class="tips">�磺����������ǰ���ȡ�</span></td>
        </tr>


        <tr>
            <td align="right" class="lefttd" height="30" style="width: 198px">
                <strong>�� �� �ţ�</strong></td>
            <td class="righttd">
                &nbsp;<asp:TextBox CssClass="textbox" ID="OrderID" runat="server" Width="60px"></asp:TextBox><span class="tips">���ԽС����Խǰ�档</span></td>
        </tr>
      </table>
      <br />
        <KS:Foot ID="Foot1" runat="server" OnSubmit="Foot1_Submit" />
      
    </asp:Panel>

  </div>
</asp:Content>
