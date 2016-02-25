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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                pnlAnonimo.Visible = false;
                if(User.Identity.Name != "admin@mailticket.it")
                {
                    ServizioPrevendita obj_pre = new ServizioPrevendita();
                    ListView1.DataSource = obj_pre.RecuperaEventiMailticket();
                    ListView1.DataBind();
                    pnlUtente.Visible = true;
                    pnlAdmin.Visible = false;
                }
                else
                {
                    ServizioPrevendita obj_pre = new ServizioPrevendita();
                    ListView2.DataSource = obj_pre.RecuperaEventiMailticket();
                    ListView2.DataBind();

                    pnlUtente.Visible = false;
                    pnlAdmin.Visible = true;
                }
            }
            else
            {
                pnlAnonimo.Visible = true;
                pnlUtente.Visible = false;
                pnlAdmin.Visible = false;
            }
        }
        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Convalidare la password utente
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // Questa opzione non calcola il numero di tentativi di accesso non riusciti per il blocco dell'account
                // Per abilitare il conteggio degli errori di password per attivare il blocco, impostare shouldLockout: true
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                switch (result)
                {
                    case SignInStatus.Success:
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Tentativo di accesso non valido";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}