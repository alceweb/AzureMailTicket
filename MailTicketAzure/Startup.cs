using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MailTicketAzure.Startup))]
namespace MailTicketAzure
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
