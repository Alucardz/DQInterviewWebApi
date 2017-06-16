using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using LDAPClient;
using System.Threading.Tasks;
using DQInterviewWebApi.Models;

namespace DQInterviewWebApi.Controllers
{
    [EnableCors(origins: "http://localhost:8100", headers: "*", methods: "*")]
    [RoutePrefix("api/Login")]
    public class LoginController : ApiController
    {
        static LDAPApi __LDAP = new LDAPApi("joseph-s", "dq.com.lb", "squarerules", "dc1.dq.com.lb");
      
        private DQIDataEntities db = new DQIDataEntities();

        [Route("Login")]
        public async Task<IHttpActionResult> Login(User u) {
            var Ctrl_BambooHR = new BambooHRController();
            List<Models.User> Lst_Users = new List<Models.User>();

            if (__LDAP.validateUserByBind(u.username, u.password))
            {
                var attrs = __LDAP.getUserAttributes(u.username, new List<string>() { "mail", "displayname" });

                u.displayname = attrs["displayname"];
                u.email = attrs["mail"];
                u.password = "";

                //Fetch Employees from Bamboo
                //TODO: Cache them?
                Lst_Users = await Ctrl_BambooHR.GetEmployeeDirectory();

                ////GetBamboo ID
                //u.bambooid = Lst_Users.Where(usr => usr.Email == u.email).First().BambooId;

                //User thisUsr = db.Users.Find(u.bambooid);

                var dbUser = new Models.User() { UserName = u.username, DisplayName = u.displayname, Email = u.email };
                db.Users.Add(dbUser);
                db.SaveChanges();

                return CreatedAtRoute("DefaultApi", new { id = dbUser.BambooId }, dbUser);

                //return Ok(new {
                //    user = u
                //});
            }
            else {
                return BadRequest();
            }            
        }

    }


    public class User
    {
        public short bambooid;
        public string username;
        public string password;
        public string email;
        public string displayname;
    }
}
