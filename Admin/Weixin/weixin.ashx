<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data;
using Kesion.Publics;
using Kesion.BLL;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string action = KSCMS.S("action");
        switch (action) {
            case "ref":
                check();
                break;
        }         
    }
    public void check() {
        string keyword = DataFactory.GetOnlyValue("select id from  KS_weixinkeyword where keyword='"+Utils.ChkSQL(KSCMS.S("keyword"))+"'");
       
            if (Utils.StrToInt(keyword)>0)
            {
              KSCMS.Die("ok");
            }else{
            KSCMS.Die("no");
            }       
    
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}