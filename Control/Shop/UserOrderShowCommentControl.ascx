<%@ Control Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.Shop.UserOrderShowCommentControl" Codebehind="UserOrderShowCommentControl.ascx.cs" %>
<%@ Import Namespace="Kesion.Cache"%>
<%@ Import Namespace="Kesion.Publics"%>
<%@ Import Namespace="Kesion.APPCode"%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="Kesion.BLL"%>

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

<asp:Repeater ID="Repeater1" runat="server" onitemdatabound="Repeater1_ItemDataBound" >
   <HeaderTemplate>
        <h3>����Ʒ��������</h3>
         
          </HeaderTemplate>
          <ItemTemplate>
        <ul>
        	<li class="product">��Ʒ</li>
            <li>�ҵ�����</li>
        </ul>
      
        <div class="comment_con">
        	<div class="left">
            	<div class="img">
                    <img height="110" src="<%# Kesion.NET.WebSite.User_MyComment.GetDefaultPic(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid")))%>" width="110" />
                </div>
                <p> <%# Kesion.NET.WebSite.User_MyComment.GetTitle(Convert.ToInt16(Eval("ordertype")),Convert.ToInt32(Eval("infoid"))) %></p>
                  
            </div>
        	<div class="right" style="line-height:30px;">
                  <asp:Repeater ID="Repeater2" runat="server">
                   <ItemTemplate>
                     ���۵ȼ���<%# Kesion.NET.WebSite.User_MyComment.GetCommentStar(Convert.ToString(Eval("orderId")), Convert.ToInt32(Eval("proid"))) %><br /> 
                     �������ǣ�<img src="../../sysimg/star/star-<%# Eval("starnum") %>.jpg"><br />
                     ��������:<%# Convert.ToString(Eval("content")).Replace("\n","<br/>") %><br />
                     ����ʱ�䣺<%# Eval("AddDate") %><br />
                     ɹͼ��  
                        <style>
                         .imglist {
                         }
                         .imglist li {width:160px;float:left;height:160px;
                         }
                          .imglist li img {
                            width:150px;height:150px;border:1px solid #ccc;cursor:pointer;
                          }
                     </style>
                     <div class="imglist">
                     <%# GetST(Convert.ToString(Eval("photourls"))) %>
                     </div>
                    </ItemTemplate>
                       <FooterTemplate>
                        
                      </FooterTemplate>
               </asp:Repeater>

            </div>
            <div class="clear"></div>
        </div>

         </ItemTemplate>
         <FooterTemplate>
          </FooterTemplate>
         </asp:Repeater>

  
        </div>
     
    </div>
    

<div style="text-align:center;margin:20px;">
    <input type="button" class="button" id="backBtn" value="���ض�������" onclick="history.back(-1);" />
</div>



