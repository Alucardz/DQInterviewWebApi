using System.Collections.Generic;
using System.Web.Http;
using BambooHR;
using System.Threading.Tasks;
using System.Web.Http.Cors;
using System.Security.Cryptography;
using System;
using System.DirectoryServices.Protocols;
using System.IO;
using System.Data;

namespace DQInterviewWebApi.Controllers
{
    [EnableCors(origins: "http://localhost:8100", headers: "*", methods: "*")]
    public class BambooHRController : ApiController
    {
        string __APIKEY = "1d0a56d875b115ff4c213582290776694749e216";
        string __DQSUBDOMAIN = "dataquest";
        public static BambooAPIClient __API;
        private object ResultCode;

        public BambooHRController() {
            __API = new BambooAPIClient(__DQSUBDOMAIN);
            __API.setSecretKey(__APIKEY);
        }


        public async Task<List<string>> GetJobTitles()
        {

            var res = await __API.getJobTitles();

            return res;
        }

        public async Task<List<Models.User>> GetEmployeeDirectory()
        {
            string allList = "";
            DataSet DS_AllLists = new DataSet();
            List<Models.User> Lst_Users = new List<Models.User>();
            try
            {

                var res = await __API.getEmployeeDirectory();
                allList = res.getContentString();
                if (!string.IsNullOrEmpty(allList))
                {
                    DS_AllLists.ReadXml(new StringReader(allList));
                    
                }
                return Lst_Users;
            }
            catch (Exception)
            {
                throw;
            }
            
        }

        public async Task<string> DQLogin(string username, string password)
        {
            var res = await __API.DQLogin(__APIKEY, username, password);

            return res;
        }

    }
}
