<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin_AskClass" Title="�ʴ�������" Codebehind="KS.AskCategory.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
         
     <asp:Panel ID="ClassList" runat="server" Width="100%">
     <div id="manage_top" class="menu_top_fixed">
       <ul>
         <li id='p1'><asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"><b></b>����ʴ����</asp:LinkButton></li>
          <li id='p3'><asp:LinkButton ID="delbutton" runat="server" OnClientClick="if (GetIDS('del')){return true}else{return false}" onclick="BtnDelete_Click"><b></b>ɾ������</asp:LinkButton></li>
           <li id='p5'><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b></b>һ����������</asp:LinkButton></li>
         <li id='p7'><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><b></b>N����������</asp:LinkButton></li>
      <li id='p6'><asp:LinkButton ID="LinkButton3" runat="server" 
              onclick="LinkButton3_Click"><b></b>һ���ؼƸ��������µ��ʴ���</asp:LinkButton></li> </ul>
     </div>
     <div class="menu_top_fixed_height"></div>   
<div class="content-area">


 <div class="tabs_header">
    <ul class="tabs">
    <li class='active'><a href="KS.AskCategory.aspx"><span>�ʰ��������</span></a></li>
    <li><a href="KS.AskZJType.aspx"><span>�ʰ�ר�ҷ���</span></a></li>
    </ul>
 </div>

 <script type="text/javascript">
function ExtSub(ID,event) {//��ֹð�ݵ���parent
    var e = (event) ? event : window.event;
    if (window.event) {//IE
        e.cancelBubble = true;
    } else { //FF
        e.stopPropagation();
    }
    if (jQuery('#C'+ID).attr('class')=="tree_Close")
    {       
        jQuery('#C'+ID).attr('class','tree_Open');
        if ($(".CTable").find("tr[attr*=',"+ID+",']").length>0){
            $(".CTable").find("tr[attr*=',"+ID+",']").show();
        }else{
            jQuery('#ajaxmsg',window.parent.document).toggle();
            jQuery.ajax({
                type: "POST",
                url: "KS.AskCategory.aspx",
                data: "parentid="+ID+"&action=ExtSub",
                success: function (data) {
                    jQuery('#ajaxmsg',window.parent.document).toggle();
                    jQuery("#sub"+ID).after(data);
                }
            });
        }
    }
    else{
        $(".CTable").find("tr[attr*=',"+ID+",']").hide();
        jQuery('#C'+ID).attr('class','tree_Close');
    }
}
</script>

      <asp:Repeater ID="list" runat="server">
          <HeaderTemplate>
           <table width="99%"  cellpadding="0" cellspacing="0"  class="CTable">
           <tr class="CTitle">
				<th scope="col"><input type="checkbox" name="chkall" onclick="CheckBox(this.checked);" for="chkall"/></th>
				<th scope="col">����ID</th>
                <th scope="col" style="text-align:left">��������(<a class="tips" style="font-weight:normal" href="KS.AskCategory.aspx?action=showall">չ��</a>)</th>
				<th>������</th>
				<th scope="col">���</th><th scope="col">�������</th>
			</tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr id='sub<%#Eval("classid") %>' onmouseover="jQuery('#a<%# Eval("classid") %>').show();this.className='CtrMouseOver'" onmouseout="jQuery('#a<%# Eval("classid") %>').hide();this.className='CtrMouseOut'" onclick="chk(this)">
             <td class="Ctd" style="text-align:center;width:30px;"><input type="checkbox" name="ids" value='<%#Eval("classID")%>' /></td>
             <td class="Ctd" style="text-align:center;width:50px;"><%# Eval("classid") %></td>
             <td class="Ctd" style="height:30px;width:450px;">
             <%if (KSCMS.S("Action") != "showall")
               { %>
             <a href="javascript:void(0)" onclick='ExtSub("<%# Eval("ClassID") %>",event);' style='text-decoration:none'><%# getClassName(Convert.ToInt32(Eval("ClassID")),Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%></a><%}
               else
               { %><%# getClassName(Convert.ToInt32(Eval("ClassID")),Eval("Classname", "{0}"), Convert.ToInt16(Eval("child")), Convert.ToInt16(Eval("NextID")), Convert.ToInt16(Eval("depth", "{0}")), 1)%><%} %>
               
               <span id="a<%# Eval("classid") %>" style="display:none;padding-left:20px">
                <a style="color:#999" href="KS.AskCategory.Aspx?action=add&parentid=<%# Eval("classid") %>">����ӷ���</a>
               </span>
               </td>
             <td class="Ctd" align="center">
              ���⣺<%# Eval("QueNum") %>�ش�<%#Eval("AnsNum") %></td>
             <td class="Ctd" align="center" style="width:50px;"><%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%></td>
             <td class="Ctd link-operate" align="center">
              <a href="KS.AskCategory.Aspx?action=edit&classid=<%# Eval("classid") %>">�༭</a>
              <a href="KS.AskCategory.Aspx?Action=del&Ids=<%# Eval("classid") %>" onclick="return(confirm('ɾ�����࣬ͬʱɾ���÷����µ��ʴ𣬴˲��������棬ȷ��ɾ��������?'));">ɾ��</a>
              <a href='<%# GetClassUrl(Convert.ToInt32(Eval("ClassID"))) %>'target="_blank">Ԥ��</a>
             </td>
            </tr>
          
          </ItemTemplate>
          <FooterTemplate>
               <tr style="display:<%# bool.Parse((list.Items.Count==0).ToString())?"":"none"%>">
                <td class="Ctd" style="text-align:center" colspan="5">
                 <asp:LinkButton ID="addbutton" runat="server" OnClick="lbtaddmodel_Click"> ��û������κη��࣬�����ӷ���&raquo;</asp:LinkButton>
                </td>
               </tr> 
          </table>
          </FooterTemplate>
         </asp:Repeater>


          <KS:Page ID="Page1" runat="server" />
         
          <br />
        <script type="text/javascript">
            showtips('<span class="state"><strong>����˵����</strong><br /></span>��ʹ�ñ�ǩ{$GetAskCategory}��ǰ̨ģ����ó��ʴ���ࡣ');
		</script>
         
        </asp:Panel> 
        
        <asp:Panel ID="ClassAdd" runat="server" Width="100%">
        <script>
	        function setFileFileds(num){    
             for(var i=1,str="";i<=20;i++){
	            jQuery("#define" + i).css("display","none");
              }
             for(var i=1,str="";i<=num;i++){	jQuery("#define" + i).css("display","");
                 }
            }



            function CheckAddMode() {
                if (jQuery("#AddType")[0].checked == true) {
                    jQuery("#AddOne").hide();
                    jQuery("#AddMore").show();
                } else {
                    jQuery("#AddOne").show();
                    jQuery("#AddMore").hide();
                }
            }

            function CheckForm() {
                if (jQuery('#<%=this.ClassName.ClientID %>').val() == '' && jQuery("#AddType")[0].checked == false) {
                    KesionJS.Alert('�������ʴ�������ƣ�', "jQuery('#<%=this.ClassName.ClientID %>').focus()");
                    return false;
                } else if (jQuery("#AddType")[0].checked == true && jQuery('#<%=this.TxtMoreClassName.ClientID %>').val() == '') {
                    KesionJS.Alert('�밴��ʽ�����ʴ��������,һ�б�ʾһ�����࣡', "jQuery('#<%=this.TxtMoreClassName.ClientID %>').focus()");
                    return false;
                }
            }
	    </script>
	 </div>   

        <KS:TopNav ID="TopNav1" runat="server" Text="������ʴ����" />
     <div class="content-area">
       	<div class="tab-page" id="AskClassPanel">
         <script type="text/javascript">
             var tabPane1 = new WebFXTabPane(document.getElementById("AskClassPanel"), 1)
         </script>
             
		 <div class="tab-page" id="tab0">
		  <h2 class="tab">������Ϣ</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab0" ) );
			</script>
			
             <table width="100%" border="0" cellpadding="1" cellspacing="1" class="CTable">
				   <tr>
                       <td align="right" class="lefttd" style="width: 155px; height: 37px;"><strong>
                           �������ࣺ</strong><br>
                         </td>
                         <td width="751" class="righttd" style="height: 37px">
                             <asp:DropDownList ID="ParentID" runat="server">
                             <asp:ListItem Value="0">-�ޣ���Ϊһ�����ࣩ-</asp:ListItem>
                             </asp:DropDownList>&nbsp;
                             <span id="ParentIDMessage" runat="server"></span>
                       </td>
                     </tr>
                     
                     
                     
                    <tr>
                    <td class="lefttd" height="30" align="right" style="width: 155px">
                        <strong> �������ƣ�</strong></td>
                    <td class="righttd" width="751">
                       <span id="AddOne">
                        <asp:TextBox CssClass="textbox" ID="ClassName" runat="server"></asp:TextBox>
                        <span class="tips">*������������ƣ��磺����Ա</span>
                       </span>
                        <label style="<%=KSCMS.S("action")=="edit"?"display:none;":"" %>font-weight:bold;color:Green"><input onclick="CheckAddMode()" type="checkbox" name="AddType" id="AddType" value="1" />�л����������ģʽ</label>
                       <div id="AddMore" style="display:none">
                          <font color=red>һ�д���һ������</font><br />
                          <asp:TextBox Text="��������1" ID="TxtMoreClassName" runat="server" CssClass="textbox" TextMode="MultiLine" Width="250px" Height="150px"></asp:TextBox>
                         </div>
                         </td>
                  </tr>


                  <tr>
                    <td  class="lefttd" align="right" style="width: 155px; height: 48px"><strong>�� �� ����</strong> </td>
                    <td  class="righttd" width="751" style="height: 48px">
                        ���⣺<asp:TextBox ID="TxtQueNum" CssClass="textbox" style="text-align:center" runat="server" Width="50px" Text="0" />
                        �ش�<asp:TextBox ID="TxtAnsNum" CssClass="textbox" style="text-align:center" runat="server" Width="50px" Text="0"/>
					</td>
                  </tr>

      
                <tr id="IntroArea">
                    <td align="right"  class="lefttd" style="width: 155px; height: 50px;">
                        <strong>������ܣ�</strong><br />
                        </td>
                    <td  class="righttd" style="height: 50px">
                        <asp:TextBox CssClass="textbox" ID="ClassIntro" runat="server" rows="6"  Height="80px" TextMode="MultiLine" Width="383px"></asp:TextBox>
                           <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.ClassIntro.ClientID %>');"></a>
                           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.ClassIntro.ClientID %>');"></a>
 
                          <br />
                          <font class='tips'>�����ڷ���ҳ�Ľ�����Ϣ��֧��HTML</font> 
                        </td>
                  </tr>
                  <tr>
                    <td  height="30" class="lefttd" align="right" style="width: 155px">
                        <strong>����ͼƬ��</strong></td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="ClassImg" runat="server" Width="380px"></asp:TextBox>&nbsp;<input type="button" class="button" onclick="SelectFiles('<%=this.ClassImg.ClientID %>',101);" value="ѡ��ͼƬ">
                        <br />
                        <font class='tips'>�����ڷ���ҳ��ʾָ����ͼƬ</font>
                        </td>
              </tr>
              
              
                  
              
          </table>	

        </div>
      
		
        <div class="tab-page" id="seooption">
		  <h2 class="tab">SEOѡ��</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("seooption"));
			</script>
			
             <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
            <tr>
                    <td  height="30" align="right"  class="lefttd" style="width: 145px">
                        <strong>����META�ؼ���</strong>��<br />
                        </td>
                    <td class="righttd">
                        <asp:TextBox CssClass="textbox" ID="MetaKeyWord" runat="server" Rows="3" Height="100px" TextMode="MultiLine" Width="478px"></asp:TextBox>
                           <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaKeyWord.ClientID %>');"></a>
                           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaKeyWord.ClientID %>');"></a>
                             <br /><span class="tips">��������������õĹؼ���</span>
                        </td>
                  </tr>
                  <tr>
                         <td align="right"  class="lefttd" style="height: 76px; width: 145px;">
                             <strong>����META��ҳ������<br />
                             </strong></td>
                         <td  class="righttd" style="height: 76px">
                             <asp:TextBox CssClass="textbox" ID="MetaDescript" runat="server" rows="3" Height="100px" TextMode="MultiLine" Width="478px"></asp:TextBox>
                               <a class="textarea_min" href="javascript:zoomtextarea(-5,'<%=this.MetaDescript.ClientID %>');"></a>
                           <a class="textarea_max" href="javascript:zoomtextarea(5,'<%=this.MetaDescript.ClientID %>');"></a>
                            <br /> <span class="tips">��������������õ���ҳ����</span>
                        </td>
                  </tr>
                   </table>
 </div>
		
		
		 <div class="tab-page" id="tab1">
		  <h2 class="tab">��������</h2>
			<script type="text/javascript">
						 tabPane1.addTabPage( document.getElementById( "tab1" ) );
			</script>
			
 <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
         <tr>           
             <td height='30' align='right' width='210' class='lefttd'><strong>������������</strong></td>
           <td height='28' class="righttd">
              &nbsp;<select name="ClassDefine_Num" id="ClassDefine_Num" onChange="setFileFileds(this.value)"><option value="1" selected>1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> </select>             </td>
         </tr>
         
         <%for (int i = 1; i <= 20; i++)
           {
           %>
           <tbody id="define<%=i %>" style="display:none">
         <tr>           
          <td height='30' align='right' width='210' class='lefttd'><strong>��������<%=i %>��</strong><br> <font color=blue>�ڷ���ģ��ҳ����{$GetAskClassDefineContent<%=i %>} ����</font>
             </td>
             <td class="righttd">&nbsp;<textarea class="textbox" cols="10" ID='ClassDefineContent<%=i %>' Name='ClassDefineContent<%=i %>' style='width:500px;height:100px'><% try
                {
                    Response.Write(param[i - 1].ToString());
                }
               catch{}%></textarea> 
                  <a class="textarea_min" href="javascript:zoomtextarea(-5,'ClassDefineContent<%=i %>');"></a>
                   <a class="textarea_max" href="javascript:zoomtextarea(5,'ClassDefineContent<%=i %>');"></a>
             </td>
         </tr>
         </tbody>
         <%} %>
         </table>			
			
        </div>
        
        <div class="tab-page" id="tab2">
		  <h2 class="tab">�����ǩ</h2>
			<script type="text/javascript">
			    tabPane1.addTabPage(document.getElementById("tab2"));
			</script>
			
 <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="CTable">
         <tr>           
             <td height='30' align='right' width='210' class='lefttd'><strong>��������ñ�ǩ��</strong></td>
           <td height='28' class="righttd">
             <li>����ID��{$GetAskClassID}</li>
             <li>�������ƣ�{$GetAskClassName}</li>
             <li>������ܣ�{$GetAskClassIntro}</li>
             <li>����ͼƬ��{$GetAskClassImgSrc}</li>
             <li>����URL��{$GetAskClassURL}</li>
             <li>������������{$GetAskClassQueNum}</li>
             <li>���������{$GetAskClassAnsNum}</li>
             <li>����MetaKeyWords��{$GetAskClassMetaKeyWords}</li>
             <li>����MetaDescrtion��{$GetAskClassMetaDescript}</li>
             <li>�����������ݣ�{$GetAskClassDefineContent<font color=red>n</font>}
             
             nȡ1-20��ֵ��</li>
             <li>����ҳ���Ƿ����鿴��{$GetSearchBySolve}</li>

             <li>����ҳ���ʴ����鿴��{$GetSearchByAskClass}</li>
             <li>ȫվ�����ǩ(����)��{$GetAskCategory}</li>
              
              </td>
         </tr>
         </table>
        
        
       </div>
      
      <div style="clear:both;text-align:center" class="main-button">
          <KS:Foot ID="Foot1" runat="server" OnSubmit="SaveButton_Click" />
      </div>
        </asp:Panel>
        
   </div>  
</asp:Content>