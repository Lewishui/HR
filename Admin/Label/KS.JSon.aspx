<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_Label_JSon" Title="Untitled Page" Codebehind="KS.JSon.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<script type="text/javascript">
    function addclass(parentid,classid)
    {  
        parent.openWin("json�������","<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/label/KS.LabelClass.aspx?parentid="+parentid+"&classid="+classid+"&classtype=<%=LabelType %>&templateId=<%=templateId%>",true,680,380);
    } 
    function label(title,url)
    {  
      parent.openWin(title,'label/'+url,true,900,550);
    } 
    function labelclone(labelid)
    {
        parent.openWin("��¡Json","<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/label/KS.LabelClone.aspx?labelid="+labelid,true,600,250);
    }

    function GetMyIds() {
        var sid = null;
        for (var i = 0; i < document.getElementsByName("ids").length; i++) {
            var KS = document.getElementsByName("ids")[i];
            if (KS.checked == true) {
                if (sid == null)
                    sid = KS.value;
                else
                    sid += "," + KS.value;
            }
        }
        return sid;
    }
    function edit(id,type,labelflag)
    {
      if (type==0){
       addclass(<%=ClassID %>,id);
      }else{
           location.href='KS.JsonSQL.aspx?labeltype=<%=LabelType %>&labelid='+id;
      }

    }
   </script>
<div id="manage_top" class="menu_top_fixed">
    <span style="float:right; padding-right:10px;"><%=templateName %></span>
<ul>

      <li id='p1'>
      <a href="#" onclick="addclass(<%=ClassID %>,0);return false;" title="������ǩ����"><b></b>�½�json����</a></li>
      <li id='p8'><a href="KS.JsonSQL.aspx?LabelType=<%=LabelType %>&ClassID=<%=ClassID %>"><b></b>�½�json����</a></li>
      <li id="p3"><asp:LinkButton ID="delLabel" runat="server" Text="ɾ����ǩ" OnClick="DelButton_Click" OnClientClick="return(GetIDS());"><b></b>ɾ��json����</asp:LinkButton></li>
      <li id="p2"><a href="KS.JsonInOrOut.aspx"><b></b>json���뵼��</a></li>
      <li id='p9'><a href="?LabelType=<%=LabelType %>&ClassID=<%=ParentID %>"><b></b>����һ��</a></li></ul>
  </div>
  <div class="menu_top_fixed_height"></div> 
  
<div class="content-area">  
<div class="myTitle">
	�Խ�json����
    <div class="quickSearch">
        ����json��<asp:TextBox runat="server" ID="TxtKeyWord" CssClass="textbox" /> 
      <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="��ʼ����" 
                     onclick="BtnSearch_Click" />
        </div>
   </div>     

  <%if (LabelType == 2)
    { %>
  <style>
  .labellist{width:450px;overflow:auto;}
  .labellist div{width:150px;height:25px;float:left}
  .labellist li{clear:both}
  </style>
  <%}
    else
    {%>
    <style>
  .labellist{width:140px}
  </style>
  <%} %>
<div style="position:relative; z-index:400">
<div id="lbtype" style="position:absolute;left:80px; top:-16px;display:none" onMouseOver="jQuery('#lbtype').show();"  onmouseout="jQuery('#lbtype').hide();">
<div class="labellist" style="background-color: #f0f9fe; border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;border-right-style: solid; border-bottom-style: solid;	border-left-style: solid;	border-right-color: #BCDBF8;border-bottom-color: #BCDBF8;border-left-color: #BCDBF8;padding: 0px 0px 5px 0px;  filter:alpha(opacity=85);">

</div>
</div>
</div>


  
 <KS:KSGV ID="List" cssclass="CTable" runat='server' AllowPaging="true" PageSize="20" 
        PagerType="CustomNumeric" Width="99%" EmptyDataText="û���ҵ�Json��¼��" AutoGenerateColumns="False" GridLines="None" 
        OnRowDataBound="List_RowDataBound" OnRowCommand="List_RowCommand" 
        OnRowCreated="List_RowCreated" 
        onpageindexchanging="List_PageIndexChanging" CellSpacing="1">
                <Columns>
                    <asp:BoundField HeaderText="��ǩID" DataField="classid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>

               <asp:TemplateField HeaderText="&lt;input type='checkbox' name='chkall' id='chkall' onclick='CheckAll(this.form);'/&gt;">
                        <ItemStyle HorizontalAlign="Center"  Width="35px"/>
                        <ItemTemplate>
                         <%#GetCheckBox(Convert.ToInt32(Eval("OrderID")),Convert.ToInt32(Eval("classid"))) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="��ǩ����">
                        <itemtemplate>
                        &nbsp;
                            <%#GetImg(Convert.ToInt16(Eval("OrderID")),LabelType)%>
                             <%#GetName(Convert.ToString(Eval("ClassName")),Convert.ToInt32(Eval("ClassID")),Convert.ToInt32(Eval("OrderID")),Convert.ToInt32(Eval("labelflag"))) %> 
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="�� ��" DataField="orderid" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="��ǩ����" DataField="LabelFlag" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="����ʱ��">
                        <itemstyle horizontalalign="Center" />
                        <itemtemplate>
                         <span class="tips"><%# Utils.FormatHumanizedTime(Convert.ToDateTime(Eval("AddDate"))) %></span>
                        </itemtemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="�༭">
                       <itemstyle horizontalalign="Center" width="25px"/>
                        <itemtemplate>
                          <a href="#" class="edit" onclick="edit(<%# Eval("ClassID", "{0}")%>,<%#Eval("orderid") %>,<%#Eval("labelflag") %>);return false;" title="�༭"></a>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ɾ��">
                       <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                         <a class="delete" href='?Action=del&id=<%#Eval("classid") %>&orderid=<%#Eval("orderid") %>&labeltype=<%=LabelType %>&ClassID=<%=ClassID %>&templateId=<%=templateId %>' title="ɾ��" onclick="return(confirm('�˲��������棬ȷ��ɾ��������?'))"></a>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="��¡">
                        <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                        <a href="javascript:" onclick="labelclone(<%# Eval("classid") %>)"  title="��¡��ǩ" class="copy"></a>
                      </itemtemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="���">
                        <itemstyle horizontalalign="Center" width="25"/>
                        <itemtemplate>
                        <a href="../../plus/json.aspx?<%# string.IsNullOrEmpty(Convert.ToString(Eval("jsonid")))?"jsonid="+ Eval("classid") :"jid="+Eval("jsonid") %>" target="_blank" title="�������" class="preview">�鿴</a>
                      </itemtemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" 
                    NextPageText="��һҳ" PreviousPageText="��һҳ" />
                <EmptyDataRowStyle CssClass="emptycss" />
                <PagerStyle BorderStyle="None" BorderWidth="1px" Height="40px" Wrap="True" />
                <HeaderStyle CssClass="CTitle" />
            </KS:KSGV>
           
	</div>
           
</asp:Content>

