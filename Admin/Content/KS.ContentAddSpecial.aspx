<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_ContentAddSpecial" Title="���/�༭��Ϣ" Codebehind="KS.ContentAddSpecial.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
     <div style="text-align:center">
         ID�б�<asp:TextBox ID="ContentIDS" CssClass="textbox" runat="server" ReadOnly="True"></asp:TextBox>
         <br /><br />
    <div id="SpecialPannel" runat="server"></div>
         <span class="tips">С��ʾ����ѡ�ɰ�<font color=red>Shift</font>��</span>
         <div class="pop-button">
      <asp:Button ID="Button1" runat="server" CssClass="button" Text="ȷ������" OnClick="Button1_Click" />
       <asp:Button ID="Button2" runat="server" CssClass="button" Text="�ر�ȡ��" />
       </div>
       </div>
    </form>
</asp:Content>
