<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master"  AutoEventWireup="true" Inherits="Kesion.Weixin.WebSite.weixin_userlist" Codebehind="KS.Userlist.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server"> 
     
         <link href="/admin/weixin/images/style.css" rel="stylesheet" />
    <script>
        $(function () {
            var w = 250;
            var h = 50;
            $(".prompt_box").css("position", "fixed");
            $(".prompt_box").css("width", w).css("height", h);

            var x = ($(window).width() - w) / 2;
            var y = ($(window).height() - h) / 3;
            $(".prompt_box").css("top", y).css("left", x);


        });

</script>
    <script type="text/javascript">
        function look() {

            $("#zuijinLoading").show();
            //$('.newnum').html()
           // jQuery(parent.document).find("#ajaxmsg").toggle();
            $.ajax({
                url: "KS.Userlist.aspx?action=ref&newnum=<%=newCount%>&rnd=" + Math.random(),
                context: document.body,
                type: "get",
                success: function (data) {
                   // jQuery('#ajaxmsg', window.parent.document).toggle();
                    if (data =='ok') {
                        KesionJS.Alert("粉丝获取成功", "location.reload();");
                    } else {
                        KesionJS.Alert("获取失败", "location.reload();");
                    }
                    $("#zuijinLoading").hide();
                   // jQuery('#ajaxmsg', window.parent.document).fadeOut("slow");
                }
            });
            return false;
        }  
          
        function RefAll() {

            $("#Loading").show();
            $.ajax({
                url: "KS.Userlist.aspx?action=RefAll&rnd=" + Math.random(),
                context: document.body,
                type: "get",
                success: function (data) {
                    // jQuery('#ajaxmsg', window.parent.document).toggle();
                    if (data == 'ok') {
                        KesionJS.Alert("粉丝获取成功", "location.reload();");
                    } else {
                        KesionJS.Alert("粉丝获取失败", "location.reload();");
                    }
                    $("#Loading").hide();
                    
                }
            });
            return false;
        }



//function myrefresh(){ 
//window.location.reload(); 
//} 
//setTimeout('myrefresh()',60000); //指定1秒刷新一次 


      
     </script>
         
<div class="content01">
     
<asp:Panel ID="Panel1" runat="server" Width="100%">  
        
   <div class="prompt_bg" style="display:none" id="Loading">
		<div class="prompt_box">
		  <p><img src="/admin/weixin/images/loading.gif" />正在刷新所有，可能有点卡，请耐心等待...</p>
		</div>
	</div>
     <div class="prompt_bg" style="display:none" id="zuijinLoading">
		<div class="prompt_box">
		  <p><img src="/admin/weixin/images/loading.gif" />正在刷新最近，请耐心等待...</p>
		</div>
	</div>
	<div id="manage_top" class="menu_top_fixed">
		 
	</div>

	<div class="menu_top_fixed_height"></div> 
  <div class="content-area">    
	<div class="openKey" style="padding: 10px;margin:0 20px; font-weight:normal;">如果您对粉丝已经移动分组，粉丝列表没有变化的话，请重新点击刷新按钮，如果移动分组的下拉没有变化，是因为缓存的原因，其实微信平台的数据已经更新啦，请您耐心等待！<br /><font color="red">注意移动分组最多只全选50个粉丝同时进行分组！这里的删除是操作数据库</font></div>
	<div class="search_group">
		  <div class="search">
					<asp:TextBox ID="TxtKey" runat="server" class="search_box"></asp:TextBox>
					<asp:Button ID="buttonsearch" runat="server" Text=" " OnClick="buttonsearch_Click" class="search_btn"/>
		  </div>
       <!--   <asp:Button ID="Button2" runat="server" Text="从微信同步到本地"  OnClientClick="return(RefAll())" CssClass="delete_fans"/>-->
         <asp:Button ID="Button1" runat="server" Text="删除粉丝"  OnClientClick="if (GetIDS('del')){return true}else{return false}" OnClick="Button1_Click" CssClass="delete_fans"/>
         <asp:Button ID="BtnRefAll" runat="server" Text="从微信同步到本站" CssClass="delete_fans" OnClick="BtnRefAll_Click" />
<%--         <asp:Button ID="Butn_New" runat="server" Text="刷新最新粉丝"  OnClientClick="return(look())" CssClass="delete_fans"/>--%>

		  
          <a href="KS.GroupManageList.aspx">分组管理</a>
		  <div class="clear"></div>
	</div>
	<div class="bottom_group">
		 <ul>
			 <li id="p15">
		
				 
				 <div class="shuaixuan">
                    <input type="checkbox" name="chkall" id="chkall" onClick="CheckAll(this.form);" class="qx_btn"/>全选
<%--				  <asp:CheckBox ID="CheckAll" runat="server" CssClass="checkstyle" OnCheckedChanged="CheckAll_CheckedChanged" /><span style="margin-right: 20px;">全选 </span>--%>
					    
					  <asp:DropDownList ID="DDlAddgroups" CssClass="DDlAddgroups" runat="server" OnSelectedIndexChanged="DDlAddgroups_SelectedIndexChanged" >
					  </asp:DropDownList>
					   <asp:DropDownList ID="DDLgroups" runat="server"  OnSelectedIndexChanged="DDLgroups_SelectedIndexChanged" AutoPostBack="true">
					  </asp:DropDownList>
				 </div>
			  
				 
			 </li>
	   
			 <span class="tishi_message">
		  总共 <font style="color:Red"><asp:Label ID="count" runat="server" Text="0"/></font>位粉丝 ,今日新增<font style="color:Red" class="newnum"><%=todayCount%></font>位粉丝
			 </span>
	
			 <span style="float:right; padding-right:10px; height:25px; line-height:25px;">
			  <asp:DropDownList ID="drSex" runat="server"  AutoPostBack="true" 
					 onselectedindexchanged="drSex_SelectedIndexChanged">
				   <asp:ListItem Selected="True" Value="0">--按性别查看--</asp:ListItem>
				   <asp:ListItem Value="1"> 男</asp:ListItem>
				   <asp:ListItem Value="2"> 女</asp:ListItem>
				</asp:DropDownList>
			 </span>  
			 <div class="clear"></div>
		</ul>
	  
		<div class="messagebox">
		 <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
			<HeaderTemplate>
				 <table width="99%" class="CTable" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr class="CTitle">
						  <td></td>
						  <td>编号</td>	 	 	
						  <td>微信头像</td>
						  <td>昵称（备注名）</td>
						  <td>性别</td>
						  <td>关注时间</td>
						  <td>城市</td>
						  <td>所属分组</td>
						  <td>操作</td>
						</tr>       
			 </HeaderTemplate>
			<ItemTemplate>
				<tr>    
					<td style="padding-left:15px;">
						<asp:Label ID="lbwxopenID" runat="server" Text='<%#Eval("OpenID") %>'  Visible="false"></asp:Label>
<%--						<asp:CheckBox ID="CheckIn" runat="server" CssClass="checkstyle" /></td>    --%>
                <input type="checkbox"  name="ids" id="ids" value='<%#Eval("id") %>' />
					<td align="center" style="color: #999;"><%# Repeater1.Items.Count+1%></td>     
					 <td align="center"> 
						   <img src="<%# Eval("headimgurl")%>" height="40" width="50" title='OpenID：<%# Eval("OpenID") %>'/>
				  </td>
					 <td align="center" style="color: #999;"><%# Eval("nickname")%><%#Convert.ToString(Eval("Remark").ToString())==string.Empty?"":"<font color='red'>("+Eval("Remark").ToString()+")</font>" %></td>
					 <td align="center" style="color: #999;"><%# Eval("sex").ToString()=="1"?"男":"女"%></td>
					 <td align="center" style="color: #999;"><%# Eval("subscribe_time")%></td>
					 <td align="center" style="color: #999;"><%# Eval("city")%></td>
					 <td align="center"> <asp:Label ID="lbgroupId" runat="server" CssClass="checkstyle" Visible="false" Text='<%#Eval("GroupID") %>'></asp:Label>
						 <asp:TextBox ID="TxtGroupName" runat="server" CssClass="TxtGroupName" style="color: #999;"></asp:TextBox>
					 </td>
				   
					<td align="center"> 
						<a class="update_user"  href="javascript:void(0)" onclick="top.openWin('修改备注','weixin/KS.Userlist.aspx?action=modifyremark&openid=<%#Eval("OpenID") %>',true,500,250)" title="修改备注">修改备注</a>
					</td>
				</tr>
		     </ItemTemplate>
		     <FooterTemplate>
			  
				 <tr width="100%" style="display:<%# bool.Parse((Repeater1.Items.Count==0).ToString())?"":"none"%>">
				
						<td class="empty" colspan="9" style="padding: 10px;text-align: center;">
						  你还没有粉丝信息
						</td>
				  </tr>
				  
				  </table>
			 </FooterTemplate>
			</asp:Repeater>
		</div>
	</div> 
<KS:Page ID="Page1" runat="server" />
    </asp:Panel >   
    <asp:Panel ID="Panel2" runat="server">
	 <table style=" width:100%;margin:20px auto 20px auto;" cellpadding="0" cellspacing="0">
         <tr>
			<td style="text-align:right;"><strong>OpenID：</strong></td>
			<td><%=KSCMS.S("OpenID") %></td>
		  </tr>
		  <tr>
			<td style="text-align:right;"><strong>备注名称：</strong></td>
			<td> 
			  <asp:TextBox ID="txtRemarkName" CssClass="inputstyle" runat="server" MaxLength="30"></asp:TextBox>
			</td>
		  </tr>
		  <tr>
			<td></td>
			<td>
				<asp:Button ID="Btn_Save" runat="server" Text="确定" OnClick="Btn_Save_Click"  CssClass="save_group"/>
	
				
		  </tr>
	 </table>


    </asp:Panel>
 </div> 


 </div> 
</asp:Content>

