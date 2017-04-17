<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Shop.Admin_DataBack" Title="���ݱ���" Codebehind="KS.DataBack.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

<asp:Panel ID="listPanel" runat="server" Width="100%">
   <KS:TopNav ID="top1" runat="server" Text="���߱������ݿ�" />
    <div class="content-area">
    <div class="con-inner">
      <script>
          function view(tablename) {
              parent.openWin('�鿴��['+tablename+']���ֶ�', 'System/KS.Data.Table.aspx?tablename=' + tablename, false);
          } 
      </script>



        <table class="CTable">
            <tr>
            <td style="width: 100px"><strong>���ݿ�����</strong></td>
            <td><asp:TextBox ID="TxtDataBaseName" CssClass="textbox" runat="server" Width="250px"></asp:TextBox>
                <span class="tips">��д���ݿ������</span>
            </td>
            </tr>
            <tr>
                <td style="width: 100px"><strong>��������</strong></td>
                <td><asp:TextBox ID="TxtFileName" CssClass="textbox" runat="server" Width="250px"></asp:TextBox>
                    <span class="tips">����:<%=DateTime.Now.ToShortDateString().Replace("/","-") %>.bak��</span></td>
            </tr>
            <tr>
            <td colspan="2"><asp:Button ID="Button1" CssClass="button" runat="server" Text="�������ݿ�" OnClick="Button1_Click" /></td>
            </tr>
        </table>
       
        <br />&nbsp;
        <strong>���ݼ�¼��</strong>

        <KS:KSGV ID="TableListView" cssclass="CTable" runat="server" AutoGenerateColumns="False"  GridLines="None"
            OnRowDataBound="FieldListView_RowDataBound" PagerType="CustomNumeric" Width="99%" EnableTheming="True" HorizontalAlign="Center" EmptyDataText="û�����ݱ�!" OnRowCommand="TableListView_RowCommand">
            <Columns>
              <asp:TemplateField HeaderText="���">
                <itemstyle horizontalalign="Center" width="50px" />
                <itemtemplate>
                    <%#Container.DataItemIndex+1%>        
                </itemtemplate>
              </asp:TemplateField>
            
                 <asp:TemplateField HeaderText="�����ļ���">
                  <itemstyle/>
                    <ItemTemplate>
                    <%# Eval("Name")%>
                  </ItemTemplate>  
                </asp:TemplateField>
               
                 <asp:TemplateField HeaderText="��С">
                  <itemstyle/>
                    <ItemTemplate>
                    <%# Eval("Size")%>
                  </ItemTemplate>  
                </asp:TemplateField>
               
                 <asp:TemplateField HeaderText="����ʱ��">
                  <itemstyle/>
                    <ItemTemplate>
                     <%# Eval("Time")%>
                  </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ɾ��">
                    <itemstyle width="30px" horizontalalign="Center"/>
                      <itemtemplate>
                          <asp:LinkButton OnClientClick="return(confirm('ȷ��ɾ����'))" runat="server" id="delete" CssClass="delete" commandargument=<%#Eval("name") %> commandname="del" ToolTip="ɾ�����ݿⱸ���ļ�"></asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
        
            </Columns>
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
        </KS:KSGV>
        <br />



        <table cellpadding="0" cellspacing="0" style="width: 100%;margin-top:10px">
            <tr>
                <td style="height: 25px">&nbsp;
                    
                    </td>
                <td style="font-size: 9pt; height: 25px; text-align: right">
                    <asp:Label ID="Label7" runat="server" Text="��ǰҳ��Ϊ��"></asp:Label>
                    <asp:TextBox ID="labPage" runat="server" AutoPostBack="True" OnTextChanged="labPage_TextChanged"
                        Text="1" Width="30px"></asp:TextBox>
                    &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="��ҳ����"></asp:Label><asp:Label ID="labBackPage"
                        runat="server"></asp:Label>
                    ҳ ÿҳ��ʾ��<asp:Label ID="labperpagenum" runat="server" Text="Label"></asp:Label>
                    ��
                    <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnOne_Click">��һҳ</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnUp_Click">��һҳ</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnNext_Click">��һҳ</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnBack_Click">���һҳ</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>



        </div>
        
         <br />
       <div class="message">
            <strong>˵����</strong><br />
            1����վ�����ݿ�û�а�װ��ͬһ̨���������޷�ʹ�ô˹��ܣ�<br />
            2�����ݿⱸ���ļ��������վ��Ŀ¼�µġ�App_Data/BackUp/��Ŀ¼��<br />
            3�����ݿⱸ�ݳɹ��󣬽��鼰ʱͨ��FTP������ص����ص��Դ�ţ�<br />

        </div>
		

     </asp:Panel>
     
  </div>
     
</asp:Content>