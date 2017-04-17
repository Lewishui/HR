<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_SMSAPI" Title="Untitled Page" Codebehind="KS.SMSAPI.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Kesion.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
    <asp:Panel ID="listPanel" runat="server" Width="100%">
       <KS:TopNav ID="TopNav2" runat="server" Text="���Žӿ�API����" />
<div class="content-area">
<div class="tab-page" id="SMSPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("SMSPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab0"));
			</script>


       <script>
           jQuery(window).load(function() {
           //setTimeout("getblance();", 1000)

           });
           function getblance() {
               jQuery("input[name=itemid]").each(function() {
                   var id = jQuery(this).val();
                   dogetbalance(id);
               });
           }
           function dogetbalance(id) {
               jQuery("#mybalance" + id).html("<img src='../../admin/images/loading.gif' />��ѯ��...");
               jQuery.get("KS.SMSAPI.aspx", { action: "balance", itemid: id }, function(val) {
                   jQuery("#mybalance" + id).html("��"+val);
               });
           }
       
       </script> 
        

             <%if (DataFactory.Exists("KS_YunManage", " YunType=2  and VideoType=11 and status=2")||Utils.IsBuyYunServer("yunsms") == "1")
               { %>
       <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
               <td class="lefttd" align="right" style="width:98px"><b>���Žӿ��ܿ��أ�</b></td>
               <td class="righttd">
                    <asp:RadioButtonList ID="RdbEnableSMS" runat="server"  RepeatLayout="Flow" 
                           RepeatDirection="Horizontal">
                       <asp:ListItem Value="0">�ر�</asp:ListItem>
                       <asp:ListItem Value="1">����</asp:ListItem>
                      </asp:RadioButtonList>
                  </td>
             </tr>


        </table>
     <%} %>
 
      <%if (Utils.IsBuyYunServer("yunsms") == "1")
         { %>
        <KS:KSGV ID="list" cssclass="CTable" runat="server" Width="100%" AutoGenerateColumns="False" EmptyDataText="�����˺�ͨAPI!" GridLines="None" OnRowDataBound="list_RowDataBound" PagerType="CustomNumeric">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="Ĭ��">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
              <asp:HiddenField ID="HidDefault" Value='<%# Eval("default") %>' runat="server" />
                 
                 <asp:RadioButton ID="RdbDefault" oncheckedchanged="RadioButton1_CheckedChanged" AutoPostBack="true" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="�ӿ�����">
                <ItemStyle HorizontalAlign="Left" />
                <ItemTemplate>
                  <%#Eval("name") %>
                  <input type="hidden" name="itemid" value="<%# Eval("id") %>" />
                  <div style='color:#999'>
                      <input type="button" class="button" value="���" onclick="dogetbalance(<%# Eval("id") %>);"/>
                      <span id="mybalance<%# Eval("id") %>"></span></div>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="�û���">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="60px" ID="TxtApiID" Text='<%#Eval("ApiID") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="���루KEY��">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox"  Width="100px" TextMode="SingleLine"  ID="TxtApiKey" Value='<%#Eval("ApiKey") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="���ͽӿ�URL">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="130px" ID="TxtApiPostUrl" Text='<%#Eval("apiposturl") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="���Ͳ���">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="140px" ID="TxtApiPostParam" Text='<%#Eval("apipostparam") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="�ɹ���־">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" Width="120px" ID="TxtSuccessTag" Text='<%#Eval("successtag") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
                
           <asp:TemplateField HeaderText="����">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                           <a class="apply" href="<%# Eval("ApplyUrl") %>" title="����" target="_blank"></a>
                        </itemtemplate>
             </asp:TemplateField>
       


            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
            
      </KS:KSGV>
  <%}
         else if (Utils.IsBuyYunServer("yunsms") == "2")
         {%>

           
             <%  
          StringBuilder sb = new StringBuilder();
          using (DataTable dt = DataFactory.GetDataTable("select top 1 * from KS_YunManage where YunType=2  "))
         {
             if (dt.Rows.Count > 0)
             {
                 DataRow dr = dt.Rows[0];
                 string id = "1";
                 string orderid = dr["OrderID"].ToString();
                 int yunId = Utils.StrToInt(dr["YunID"].ToString());
                 int status = Utils.StrToInt(dr["status"].ToString());
                 string title = dr["title"].ToString();
                 string classname = dr["ClassName"].ToString();
                 int videoType = Utils.StrToInt(dr["VideoType"].ToString());
                 if (videoType == 11)
                 {
                     id = "1";//������ʹ
                 }
                 else if (videoType == 12)
                 {
                     id = "2";//����ͨ
                 }
                 int yunsms = Utils.StrToInt(dr["CapacityNum"].ToString()) - Utils.StrToInt(dr["AlreadyMsg"].ToString());
                 if (status == 0)
                 {
                     sb.Append("�������飺ϵ�У�" + classname + ",�ƶ��ţ�" + title + ",״̬��δ֧��,<a href=\"../yun/KS.YunOpenManage.aspx?action=delete&yunid=" + yunId + "&orderid=" + orderid + "\">ɾ������</a>��");


                 }
                 else if (status == 1)//�Ѹ�
                 {
                     sb.Append("�������飺ϵ�У�" + classname + ",�ƶ��ţ�" + title + "��״̬���Ѹ��δ��ͨ��</font>");

                 }
                 else
                 {
                     //�ѹ���

                     sb.Append("�ҵ��ײ������ϵ�У�" + classname + ",�ƶ��ţ�" + title + "���û�����" + dr["UserName"].ToString() + ",���룺" + dr["PassWord"].ToString() + "��������" + SMSAPI.GetBalance(id));

                 }
                 
             }
             else
             {
                 sb.AppendLine("��Ŀǰ��û�����ƶ����أ���Ҫȥ <a href=\"" + Yun.GetServerUrl + "/mall/classid-1325.aspx\" target=\"blank\" class=\"button\">����</a>");

             }
             
         }
        
        
           %>     
<%=sb.ToString() %>
            <%} %>
  
    
             
             <%if (DataFactory.Exists("KS_YunManage", " YunType=2  and VideoType=11 and status=2")||Utils.IsBuyYunServer("yunsms") == "1")
               { %>
     <asp:Panel ID="Panel1" runat="server" Height="30px" CssClass="main-button">
            &nbsp;&nbsp;<asp:Button ID="Button1" CssClass="button" runat="server" Text="����������Žӿ�API����" 
                onclick="Button1_Click" />&nbsp;</asp:Panel>
        <%} %>
     
        <br />
             
        <script type="text/javascript">
              <%if (Utils.IsBuyYunServer("yunsms") == "1")
         { %>
            showtips('<span class="state"><strong>˵����</strong><br /></span>1������ӿڵ��û���������(Key)��Ҫ����������վ��������뷽��ʹ�á�<br/>2�����Ͳ����ı�ǩ˵����{$user}�û��� {$pass}����Key {$mobile}���յ��ֻ��� {$content}���͵�����');
            <%}else 
              {%>
            showtips('<span class="state"><strong>˵����</strong><br /></span>�����߻���û�����ݵĻ�������<a href=../Yun/KS.YunOpenManage.aspx>���</a>���������Ϊ�����ߣ�������KESION�ƶ��Ű����Ʒ���Ĳ˵����ҵ��Ʒ���Ĵ�KesionYunͬ�������ض����İ�ť');
                    
                    
                    
                    
                    
                    
                    
              
  
            <%}  %>
        </script>
	
	  </div>
    </div>
         
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">����ģ������</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab1"));
			</script>
             
             
       <table width="99%" border="0" cellpadding="1" cellspacing="1" class="CTable"> 
            <tr>
               <td class="lefttd" align="right" style="width:120px"><b>������֤���ʱ�䣺</b></td>
               <td class="righttd">
                  <asp:TextBox ID="TxtSendSMSInterval" runat="server" CssClass="textbox" style="width:40px;text-align:center"/>��
                      <span class="tips">һ������60��Ϊ�ˡ�</span>
                      <strong>����ǩ����<asp:TextBox ID="TxtSendSmsSign" Width="100" runat="server" CssClass="textbox"></asp:TextBox></strong> 
                      <span class="tips">���Žӿ������Ҫ��ǩ��������Щ���룬�磺��KESION��</span>
                  </td>
             </tr>


        </table>
       
             
             
           <KS:KSGV ID="modellist" OnRowDataBound="modellist_RowDataBound" runat="server" Width="99%" CssClass="CTable" AutoGenerateColumns="False" EmptyDataText="�����˺�ͨAPI!" GridLines="None" PagerType="CustomNumeric">
            <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:BoundField>
            <asp:TemplateField HeaderText="�Ƿ�����">
                <ItemStyle HorizontalAlign="Center" Width="60px"  />
                <ItemTemplate>
                 <asp:HiddenField ID="HidEnable" Value='<%# Eval("enable") %>' runat="server" />
                 <asp:CheckBox ID="CkbEnable" runat="server" />
                 </ItemTemplate>
            </asp:TemplateField>  
                
                
            <asp:TemplateField HeaderText="ģ������">
                <ItemStyle HorizontalAlign="Left" Width="250px"/>
                <ItemTemplate>
               <strong><%#Eval("name") %></strong>
               <div style="color:#888"><strong>��ǩ��</strong><%# Eval("tag") %>
               </div>
                 </ItemTemplate>
            </asp:TemplateField>  
 
            <asp:TemplateField HeaderText="��������">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" TextMode="MultiLine" Width="420px" height="40px" ID="TxtContent" Text='<%#Eval("content") %>' runat="server"></asp:TextBox>
                 </ItemTemplate>
            </asp:TemplateField>  
                <asp:TemplateField HeaderText="ÿ����෢������">
                <ItemStyle HorizontalAlign="Center" Width="60px"  />
                <ItemTemplate>
                  <asp:TextBox CssClass="textbox" style="text-align:center" Width="50px" ID="TxtDayPostMax" Text='<%#Eval("daypostmax") %>' runat="server"></asp:TextBox>
                 ��
                 </ItemTemplate>
            </asp:TemplateField>   
            
            </Columns>
           
            <PagerStyle CssClass="Page" HorizontalAlign="Right" />
            <HeaderStyle CssClass="CTitle" />
            <EmptyDataRowStyle CssClass="emptycss" />
      </KS:KSGV>
             
             <asp:Panel ID="Panel2" runat="server" Height="30px" CssClass="main-button">
            &nbsp;&nbsp;<asp:Button ID="Button2" CssClass="button" runat="server" Text="������������" 
                onclick="Button2_Click" />&nbsp;</asp:Panel>
                  
        
        <div class="message">
         <span class="state"><strong>˵����</strong><br /></span>
         1���󲿷ֽӿ�Ҫ�����ݼ�ǩ�����ܷ��ͳɹ���ǩ����ʽ�磺��KESION�� <br />2���������������ϸ����ƣ�һ�㲻�ܳ���70���ַ���

        </div>
        
     </div>	
    </asp:Panel>
    
 </div>  
 
</asp:Content>

