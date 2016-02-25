using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.Owin;
using MailTicketAzure.servizioprevendita;

namespace MailTicketAzure
{
    public static class MessageBox
    {
    }
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServizioPrevendita obj_pre = new ServizioPrevendita();
            //var evento = obj_pre.AggiungiAlCarrello("1", "5b157b4f-d823-49fb-aa65-78d1302a61d8", "1", "1", "1", "4862", "1", "1", "1", "1");
            //ListView1.DataSource = obj_pre.RecuperaBigliettiManMinet("UZ17");
            //ListView1.DataBind();
            var evento = obj_pre.VerificaCodicePR("", "AD15", '1', '1', "");
            Label1.Text = evento.Messaggio;
            Label2.Text = evento.Esito.ToString();
            //Label3.Text = evento.NumeroOrdine;
            //Label4.Text = evento.NumeroRiga.ToString();
        }
    }
}