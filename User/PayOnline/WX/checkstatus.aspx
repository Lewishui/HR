<%@ Page Language="C#" AutoEventWireup="true" Inherits="User_PayOnline_WX_checkstatus" Codebehind="checkstatus.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
<script runat="server">
    string orderId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        string flag = KSCMS.S("flag");
        orderId = KSCMS.S("orderId");
        if (string.IsNullOrEmpty(orderId)) KSCMS.Die("");
        if (flag == "shop")
        {
            CheckShopOrder(); //单个支付订单
        }else if (flag == "ShopMerger")
        {
            ShopMergerOrder(); //订单合并支付
        }
        else if (flag == "feepackages") //套餐包
        {
            FeePackages();
        }else if (flag == "form")
        {
            CheckFormPay(); //自定义表单支付
        }
        else {  //在线充值
            YFKCZ();
        }
        KSCMS.Die("");
    }


    private void CheckFormPay()
    {
        #region 自定义表单
        using(DataTable dt=DataFactory.GetDataTable("select top 1 * From KS_LogMoney Where OrderID='" + orderId + "'"))
        {
            if (dt.Rows.Count > 0)
            {
                KSCMS.Die("success|/user/index.aspx?mainurl=form.aspx?formid="+orderId.Split(',')[1]);
            }
        }
        #endregion
    }
    /// <summary>
    /// 商城订单
    /// </summary>
    private void CheckShopOrder()
    {
        #region 商城订单
        using (DataTable dt = DataFactoryUser.GetDataTable("Select top 1 id From KS_ProOrder Where MoneyReceipt>0 and OrderID='" + orderId + "'"))
        {
            if (dt.Rows.Count >0)
            {
                KSCMS.Die("success|/user/?mainurl=Shop/ShowMyOrder.aspx?id="+dt.Rows[0][0].ToString());
            }
        }
        #endregion

    }
    /// <summary>
    /// 合并支付订单
    /// </summary>
    private void ShopMergerOrder()
    {
        #region 合并支付订单
        using (DataTable dt = DataFactoryUser.GetDataTable("Select top 1 id From KS_ProOrder Where MoneyReceipt>0 and payorderid='" + orderId + "'"))
        {
            if (dt.Rows.Count >0)
            {
                KSCMS.Die("success|/user/?mainurl=Shop/myorder.aspx");
            }
        }
        #endregion

    }
    /// <summary>
    /// 预付款充值
    /// </summary>
    private void YFKCZ()
    {
        #region 预付款充值
        using (DataTable dt = DataFactoryUser.GetDataTable("Select top 1 * From KS_RechargeRecords Where status>0 and OrderID='" + orderId + "'"))
        {
            if (dt.Rows.Count >0)
            {
                KSCMS.Die("success|/user/index.aspx?mainurl=basic/LogMoney.aspx");
            }
        }
        #endregion
    }

    private void FeePackages()
    {
        #region 套餐包
        using(DataTable dt=DataFactory.GetDataTable("select top 1 * From KS_LogMoney Where OrderID='" + orderId + "'"))
        {
            if (dt.Rows.Count > 0)
            {
                KSCMS.Die("success|/user/index.aspx?mainurl=basic/FeePackages.aspx");
            }
        }
        #endregion
    }


</script>