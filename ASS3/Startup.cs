using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASS3.Startup))]
namespace ASS3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
