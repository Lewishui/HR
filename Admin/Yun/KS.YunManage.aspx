<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Admin.Yun.KS_YunManage" Codebehind="KS.YunManage.aspx.cs" %>

<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.APPCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" runat="server">
    <script>

        function YunDownLoad(templateId, page) {
            parent.openWin("下载云端网站风格", "<%=KSCMS.GetInstallDir()+MyCache.GetCacheConfig(4)%>/Label/KS.TemplateSkin.aspx?action=yundown&showType=-1&page=" + page + "&templateId=" + templateId, true, 820, 370);
        }
     
           function ViewPics(id){
               top.initialPrettyPhotoPicStr($("#p"+id).html());
           }
     
    </script>
 <KS:TopNav ID="TopNav1" runat="server" Text="云市场管理"/>
<div class="content-area">
       <div class="tabs_header">
    <ul class="tabs">

 <%if(Utils.GetSysInfo("//sysinfo/model/course").ToString().ToLower()=="1"){%>
    <li<%=KSCMS.S("yuntype")==string.Empty?" class='active'":string.Empty %>><a href="KS.YunManage.aspx"><span>云视频</span></a></li>
   <li<%=KSCMS.S("yuntype")=="4"?" class='active'":string.Empty %>><a href="KS.YunManage.aspx?yuntype=4"><span>云直播</span></a></li>

       <%} %>
   <li<%=(KSCMS.S("yuntype")=="2" || (Utils.GetSysInfo("//sysinfo/model/course").ToString().ToLower()!="1" && KSCMS.S("yuntype")==string.Empty))?" class='active'":string.Empty %>><a href="KS.YunManage.aspx?yuntype=2"><span>云短信</span></a></li>
        <li<%=KSCMS.S("yuntype")=="3"?" class='active'":string.Empty %>><a href="KS.YunManage.aspx?yuntype=3"><span>云模板</span></a></li>
   <li<%=KSCMS.S("yuntype")=="5"?" class='active'":string.Empty %>><a href="KS.YunManage.aspx?yuntype=5"><span>云服务器</span></a></li>
    </ul>
    </div>
  <asp:Panel ID="ListPanel" runat="server" Width="100%">
  <asp:Repeater ID="YunTemplateList" runat="server">
             <HeaderTemplate>
                  <div class="yunList clearfix">
             </HeaderTemplate>
             <ItemTemplate>
            
        	        <div class="item">
            	        <div class="border">
                            <div class="s_txt">  
                            	<div class="s_attr">
                                    <%#YunType==3?"":YunType==2?"<span>短信:<em>"+Eval("capacity").ToString()+"条</em></span>":YunType==5?Eval("cpu").ToString()==string.Empty?"<span>有效期<em>"+Eval("shixian").ToString()+"个月</em></span>":"<span>有效期<em>"+Eval("shixian").ToString()+"个月</em></span><span>"+Eval("cpu")+"</span>":YunType==1?"<span>存储空间<em>"+Eval("capacity").ToString()+"</em></span><span>有效期<em>"+Eval("shixian").ToString()+"个月</em></span><span>流量<em>"+Eval("traffic").ToString()+"</em></span>":YunType==4?"<span>并发数<em>"+Eval("capacity").ToString()+"</em></span><span>有效期<em>"+Eval("shixian").ToString()+"个月</em></span>":"" %>
                            </div>
                            	<div class="s_name">
                                    <%#Eval("templatename") %> &nbsp;<i class="bt">[ <%# Eval("classname") %>系列 ]</i>
                                 </div>
								<div class="s_intro"><%#Eval("intro") %></div>
                           
                              

                                <div class="s_intro"><%#YunType==3?"适用用于："+Eval("beapplicable"):""%></div>
                            	<span class="price"><i class="bt">价格：</i><em><%#Utils.StrToDecimal(Eval("prices"))>0?"￥"+Kesion.APPCode.Public.ReturnShopPrice(Utils.StrToDecimal(Eval("prices"))):"<font>免费</font>" %></em>
                                    

                            	</span>
                                 
                         </div>   
                         <div class="s_rbox">
                               <span id='p<%#Eval("TemplateID") %>' style="display:none"><%# Eval("pics") %></span>
                               <%#YunType==3?"<a href=\"javascript:ViewPics('"+Eval("templateid")+"')\" title=\"预览\" class=\"button\">预览</a>":"" %>
                                 
                               <%#YunType==3?Utils.StrToDecimal(Eval("prices"))>0?isHasBuy(Utils.StrToInt(Eval("templateid").ToString()),YunType,CurrPage):isHasDownYunTemplate(Utils.StrToInt(Eval("templateID")))?"<a href='#' class=\"button\">已下载</a>":@"<a href=""javascript:;"" onclick='YunDownLoad("+ Eval("templateId")+","+CurrPage+@")' class='button'>下载并导入</a>":isHasBuy(Utils.StrToInt(Eval("templateid").ToString()),YunType,CurrPage)%>
                             
                          </div>
                       </div>   
                          
                    </div>
              
                 
              </ItemTemplate>
              <FooterTemplate>
                </div>
              </FooterTemplate>
            </asp:Repeater>
         <div class="empty" style="text-align:center;" id="showEmpty" runat="server" visible="false">
                 KESION云端没有发现可购买的<%#YunType==1?"云视频":YunType==2?"云短信":YunType==3?"云模板":YunType==4?"云直播":"云服务"%>!
          </div> 
         <KS:Page ID="Page1" runat="server" />

  </asp:Panel>
 </div> 
</asp:Content>




