<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_MyComment" Title="��Ʒ���۹���" Codebehind="MyComment.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.HtmlTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">
<div class="<%=KSCMS.S("istop")=="1"?"":"r_tybox nomar" %>">

<asp:Panel ID="ListPannel" runat="server">
	<div class="tabs">	
        <ul>
           <%if (KSCMS.S("fight")!="1") { %>
            <li><a href="myorder.aspx">ȫ������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
            <li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="myorder.aspx?show=2">�������ڵĶ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where datediff(month,[InputTime],getdate())<=2 and ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
            <li<%if (KSCMS.S("show")=="-2") Response.Write (" class='puton'"); %>><a href="myorder.aspx?show=-2">�������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where MoneyReceipt<=0 and ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
            <li<%if (KSCMS.S("show")=="-3") Response.Write (" class='puton'"); %>><a href="myorder.aspx?show=-3">���ջ�����(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where DeliverStatus=1 and ordertype!=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
            <li class="puton"><a href="mycomment.aspx">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and ordertype!=2 and b.IsCmt=0 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			<li><a href="mycommentList.aspx">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
        <%} else {%>
            <li><a href="MyFightGroupBuyOrder.aspx">����(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder Where ordertype=2 and UserName='"+(new TemporaryVar()).UserName+"'")  %>)</a></li>
				<li<%if (KSCMS.S("show")=="1") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=1">ƴ����(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=0  and datediff(hour,InputTime,getdate())<limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
                <li<%if (KSCMS.S("show")=="2") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=2">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum=-1 and isend=-1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
				<li<%if (KSCMS.S("show")=="3") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=3">�ѳ���(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=1  and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
                <li<%if (KSCMS.S("show")=="4") Response.Write (" class='puton'"); %>><a href="MyFightGroupBuyOrder.aspx?show=4">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner join KS_ProOrderItem o on a.orderid=o.orderid inner join KS_ProFightGroup f on o.infoid=f.id  Where ordertype=2 and GoupNum<>-1 and isend=2   and datediff(hour,InputTime,getdate())>=limittime and UserName='"+(new TemporaryVar()).UserName+"'")%>)</a></li>
                <li class="puton"><a href="mycomment.aspx?fight=1">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=0 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
				<li><a href="mycommentList.aspx?fight=1">������(<%=DataFactory.GetOnlyValue("select count(1) From KS_ProOrder a inner Join KS_ProOrderItem b on a.OrderID=b.OrderID Where (a.DeliverStatus=2 or a.status=2) and b.IsCmt=1 and ordertype=2 and a.UserName='" + (new TemporaryVar()).UserName + "'")  %>)</a></li>
			
            <%}%>
        </ul>
	</div>


  <asp:Repeater ID="Repeater1" runat="server">
          <HeaderTemplate>
<div class="r_padbox">	          
          <table width="98%" align="center" border="0" cellpadding="1" cellspacing="1" class="border">
              <tr class="title">
               <td height="25" ><b>���</b></td>
               <td><b>������</b></td>
              <td><b>ͼƬ</b></td>
               <td><b>��Ʒ</b></td>
               <td style="text-align:center"><b>����ʱ��</b></td>
               <td style="text-align:center"><b>����</b></td>
              </tr>
          </HeaderTemplate>
         <ItemTemplate>
             <TR>
				 <td class="splittd" style="text-align:center">
				 <strong>
				<%# Container.ItemIndex + 1 + (CurrPage - 1) * PageSize%>��
				</strong>
				</td>
                <td class="splittd" ><%# Eval("OrderID")%></td>
                <td class="splittd"><img src='<%# GetDefaultPic(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid"))) %>' width="60" /></td>
                <td class="splittd" style="width:340px;">
                <%# GetTitle(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid"))) %>
                </td>
                <td class="splittd" style="text-align:center"><%# Convert.ToDateTime(Eval("InputTime")).ToShortDateString()%></td>
                <td class="splittd" style="text-align:center"><%# GetCommentTips(Convert.ToInt16(Eval("ordertype")),Convert.ToInt16(Eval("status")),Convert.ToInt16(Eval("deliverStatus")),Convert.ToString(Eval("orderId")),Convert.ToInt16(Eval("infoId"))) %></td>
			</TR>
			<tr>
         </ItemTemplate>
          <FooterTemplate>
           <tr class="tdbg emptycss" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
                <td class="splittd" style="text-align:center" colspan="7">
                 û�д����۵���Ʒ��
                </td>
               </tr> 
           </table>
          </FooterTemplate>
        </asp:Repeater>
        
        
        
           <br />
    
     <div class="fy_box"><KS:Page ID="Page1" runat="server" /></div>
</asp:Panel>


<asp:Panel ID="WritePannel" runat="server" Visible="false">
        <table  cellspacing="1" cellpadding="3" class="border" width="98%" align="center" border="0">
               <%if (KSCMS.S("istop")!="1"){ %>
	                    <tr class="title">
                                    <td colspan="2"> �����ҹ������Ʒ</td>
                         </tr>
                <%} %>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">��Ʒ���ƣ�</td>
                            <td>  <%=productName %> </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">����ʱ�䣺</td>
                            <td>  <%=buyDate %> </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">���۵ȼ���</td>
                            <td>  <asp:RadioButtonList ID="RdbCmtType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                             <asp:ListItem Value="0" Selected="True"><img src="../../sysimg/default/good.gif" align="absmiddle"/>����</asp:ListItem>
                             <asp:ListItem Value="1"><img src="../../sysimg/default/middle.gif" align="absmiddle"/>����</asp:ListItem>
                             <asp:ListItem Value="2"><img src="../../sysimg/default/bad.gif" align="absmiddle"/>����</asp:ListItem>
                            </asp:RadioButtonList> </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd" style="height:30px">����������</td>
                            <td>
                                <script>
                                    function _$(id) {
                                        return document.getElementById(id);
                                    }
                                    function select_sort(s, v) {
                                        for (i = 1; i <= 5; i++) {
                                            if (i <= v) {
                                                _$("img_" + s + i).src = "../../sysimg/default/icon_star2.gif";
                                            }
                                            else {
                                                _$("img_" + s + i).src = "../../sysimg/default/icon_star1.gif";
                                            }
                                        }
                                        if (v == 1) {
                                            _$("stext" + s).innerHTML = "<b>1��</b> - &nbsp;�ܲ�";
                                        }
                                        else if (v == 2) {
                                            _$("stext" + s).innerHTML = "<b>2��</b> - &nbsp;��";
                                        }
                                        else if (v == 3) {
                                            _$("stext" + s).innerHTML = "<b>3��</b> - &nbsp;һ��";
                                        }
                                        else if (v == 4) {
                                            _$("stext" + s).innerHTML = "<b>4��</b> - &nbsp;��";
                                        }
                                        else if (v == 5) {
                                            _$("stext" + s).innerHTML = "<b>5��</b> - �ܺ�";
                                        }
                                        $("#star").val(v);
                                    }
</script>
                                <table class="border" width="99%">
        		                <tr>
                                    <td class="splittd" width="150">
                  	                <img align="absmiddle" onMouseOver="select_sort('a','1')" src="../../sysimg/default/icon_star2.gif" id="img_a1">
                                    <img align="absmiddle" onMouseOver="select_sort('a','2')" src="../../sysimg/default/icon_star1.gif" id="img_a2">
                                    <img align="absmiddle" onMouseOver="select_sort('a','3')" src="../../sysimg/default/icon_star1.gif" id="img_a3">
                                    <img align="absmiddle" onMouseOver="select_sort('a','4')" src="../../sysimg/default/icon_star1.gif" id="img_a4">
                                    <img align="absmiddle" onMouseOver="select_sort('a','5')" src="../../sysimg/default/icon_star1.gif" id="img_a5">
                                    <input type="hidden" value="1" id="star" name="star">
                                    </td>
                                    <td class="splittd"><span id="stexta"><b>1��</b> - &nbsp;�ܺ�</span></td>
                                </tr>
                             </table>

                            
                            </td>
                          </tr>
                          <tr class="tdbg">
                            <td class="lefttd">�������ݣ�</td>
                            <td>
                            <asp:TextBox ID="TxtContent" TextMode="MultiLine" runat="server" Width="600px" Height="120px" CssClass="textbox"></asp:TextBox>
                            </td>
                          </tr>
            
                  <%if (MyCache.GetShopCommonConfig(78) == "1"){ %>
                       <tr class="tdbg">
                            <td class="lefttd">ɹͼ��</td>
                            <td>
                             <input type="hidden" name="files" id='files'/>
                     <!--�ϴ�ͼƬ��ʼ-->
                   <div class="imagebox">
		             <script type="text/javascript">
		                 function uploadOk(v,s) {
		                     box.close();
		                     if (s == undefined) s = v;
		                     if ($("#files").val() == '') {
		                         $("#files").val(s + "|" + v);
		                     } else {
		                         $("#files").val($("#files").val() + "��" + s+"|"+v);
		                     }
                             $(".upshow").append("<li><img src='" + s + "'/></li>");
		                 }
		                 function doSubmit(obj) { box = top.$.dialog({ title: false, content: '���Եȣ������ϴ��ļ�...' }); }
                     </script>
                       <div class="upshow"></div>
                           <iframe  src="../include/autoupload.aspx?channelid=4&fun=parent.parent.uploadOk" width="60" height="60" scrolling="no" frameborder="0"></iframe>
                           <span class="tips"></span>
		             </div> 
               
	            <!--�ϴ�ͼƬ����-->


                            </td>
                          </tr>

                <%} %>

                          <tr class="tdbg">
                            <td height="40">&nbsp;</td>
                            <td>
                                &nbsp; &nbsp;&nbsp;<asp:Button ID="BtnComment" CssClass="button" runat="server"  Text="OK!ȷ������" onclick="Button1_Click" />
                                &nbsp; &nbsp; &nbsp;
                             <%if (KSCMS.S("istop").Equals("1")){ %>
                                <input type="button" onclick="top.box.close();" value=" ȡ �� " class="button"/>
                                <%}else{ %>
                              <input type="reset" value=" �� �� " class="button"/>
                                <%} %>
                            </td>
                        </tr>

      </table>
      <script>
          function checkComment() {
              if (jQuery("#star").val() == 0) {
                  KesionJS.Alert("��ѡ��������������!");
                  return false;
              }
              if (jQuery("#<%=this.TxtContent.ClientID %>").val() == '') {
                  KesionJS.Alert("�������������ݣ�", 'jQuery("#<%=this.TxtContent.ClientID %>").focus()');
                  return false;
              }
              return true;
          }
      </script>
</asp:Panel>



<asp:Panel ID="PanelWriteOrder" runat="server" Visible="false">
    
<style>

/*����ҽ�������*/
.div_btn {
margin: 10px auto 25px;
padding-left: 215px;
}

.comment{
	border:1px solid #C4D5DF;
	margin:0 0 20px;
}
.comment h3{
	font-size:12px;
	background:#F2F7FA;
	height:28px;
	line-height:28px;
	padding-left:25px;
	margin:2px;
}
.comment ul{
	background:#F3F8FE;
	height:30px;
	line-height:30px;
}
.comment li{
	float:left;
	width:65px;
	text-align:center;
}
.comment .product{
	width:210px;
}
.comment .tit{
	width:100px;
}
.comment_con{
	margin:20px 0 10px;
}
.comment_con .left{
	width:210px;
	float:left;
}
.comment_con .img{
	border:1px solid #ccc;
	width:110px;
	height:110px;
	padding:1px;
	overflow:hidden;
	margin:0 auto;
}
.comment_con .left p{
	width:112px;
	overflow:hidden;
	line-height:20px;
	margin:0 auto;
	text-align:center;
}
.comment_con .right{

	float:right;
}
.comment_con .right label{
	margin:0 5px;
}
.comment_text{
	border:1px solid #CED5E0;

	padding:3px;
	margin:10px 0;
	background:#F4F6F9;
}
.comment_text textarea{padding:2px; width:534px;height:110px;background:#FFF;border:1px solid #E8E8E8;}
.comment_con1{margin:20px 0 10px; padding-left:15px;}
.comment_con1 table{line-height:30px;height:30px;}
.comment_con1 table b{	color:#FF6600;}
.comment_con .right {width: 553px;float: right;}

.comment_con1{
	margin:20px 0 10px;
}

.comment_con1 table b{
	color:#FF6600;
}
.comment_con1 table .splittd{ padding:0 10px !important}
.comment_con1 table .splittd img{ cursor:pointer}
.div_btn{
	margin:10px auto 25px;
	padding-left:215px;
}
.comment_con1 .btn{
	height:35px;
	width:122px;
	border:1px solid #3499FF;
	background:#56AAFF;
	color:#FFF;
	font-weight:bold;
	letter-spacing:1px;
}
</style>
 

<div class="comment">
<script>
    function checkform() {
        var isok=true;
        $(".comment_text").find("textarea").each(function (n) {
            if ($(this).val() == '') {
                isok = false;
                alert('�������'+(n+1)+'����Ʒ���������ݣ�' );
                $(this).focus();
                return false;
            }
        });
        return isok;
    }
    function doSubmit(obj) { box = top.$.dialog({ title: false, content: '���Եȣ������ϴ��ļ�...' }); }
</script>
    
<asp:Repeater ID="Repeater2" runat="server" >
   <HeaderTemplate>
        <h3>����Ʒ��������</h3>
         
          </HeaderTemplate>
          <ItemTemplate>
        <ul>
        	<li class="product">��Ʒ</li>
            <li>����</li>
            <li>����</li>
            <li>����</li>
        </ul>
      
        <div class="comment_con">
        	<div class="left">
            	<div class="img">
                    <img height="110" src="<%#GetDefaultPic(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid")))%>" width="110" />
                </div>
                <p> <%# GetTitle(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid"))) %></p>
                  
            </div>
        	<div class="right">

            	<table align="top" width="100%" class="border">
                	<tr>
                   
                       <asp:HiddenField  id="InfoId"  value='<%#Eval("infoid")%>'   runat="server"/>
                    	<td class="splittd" width="66">
                        
                        <input checked="checked"  type="radio" name="g<%# Eval("infoid")%>" id="good" value="0"  /><label for="good"><img src="../../sysimg/default/good.gif" /></label></td>
                    	<td class="splittd" width="66"><input  type="radio" name="g<%# Eval("infoid")%>" id="middle" value="1"  /><label for="middle"><img src="../../sysimg/default/middle.gif" /></label></td>
                    	<td class="splittd"><input type="radio" name="g<%# Eval("infoid")%>" id="bad" value="2"  /><label for="bad"><img src="../../sysimg/default/bad.gif" /></label></td>
                    </tr>
                </table>
                <div class="comment_text">
                  <textarea name="comment_text<%# Eval("infoid") %>" id='comment_text<%# Eval("infoid") %>' style="overflow:auto;"></textarea>
                </div>    
               
                  <%if (MyCache.GetShopCommonConfig(78) == "1"){ %>
                   <strong>ɹͼ��</strong>
                   <input type="hidden" name="files<%# Eval("infoid") %>" id='files<%# Eval("infoid") %>'/>
                     <!--�ϴ�ͼƬ��ʼ-->
                   <div class="imagebox">
		             <script type="text/javascript">
		                 function uploadOk<%# Eval("infoid") %>(v,s) {
		                     box.close();
		                     if (s == undefined) s = v;
		                     if ($("#files<%# Eval("infoid") %>").val() == '') {
		                         $("#files<%# Eval("infoid") %>").val(s + "|" + v);
		                     } else {
		                         $("#files<%# Eval("infoid") %>").val($("#files<%# Eval("infoid") %>").val() + "��" + s+"|"+v);
		                     }
                             $(".upshow<%# Eval("infoid") %>").append("<li><img src='" + s + "'/></li>");
		                 }
                     </script>
                       <div class="upshow upshow<%# Eval("infoid") %>"></div>
                           <iframe  src="../include/autoupload.aspx?channelid=4&fun=parent.parent.uploadOk<%# Eval("infoid") %>" width="60" height="60" scrolling="no" frameborder="0"></iframe>
                           <span class="tips"></span>
		             </div> 
               
	            <!--�ϴ�ͼƬ����-->
                <%} %>

            </div>
            <div class="clear"></div>
        </div>

         </ItemTemplate>
         <FooterTemplate>
         
          </FooterTemplate>
         </asp:Repeater>

  
 
            <input type="hidden" name="submit" value="submit" />
            <div class="div_btn">
            <asp:Button ID="Button1" runat="server" OnClientClick="return(checkform())" Text="�ύ����" CssClass="button"  onclick="BtnBatchSave_Click" />
            </div>
        </div>
     
    </div>
    

</asp:Panel>
	</div>
</div>
</asp:Content>

