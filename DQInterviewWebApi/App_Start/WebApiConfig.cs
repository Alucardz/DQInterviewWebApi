using System.Net.Http.Headers;
using System.Web.Http;

namespace DQInterviewWebApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            config.EnableCors();
            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute("CategQuestionsRoute",
                "api/Categories/{id}/Questions", 
                new { controller = "Categories", action = "GetCategoryQuestions" });

            config.Routes.MapHttpRoute("InterviewQuestionsRoute",
                "api/Interviews/Questions/{jobOpeningId}",
                new { controller = "Interviews", action = "GetInterviewQuestions" });

            //config.Routes.MapHttpRoute("JobTitles",
            //    "api/BambooHR/GetJobTitles",
            //    new { controller = "BambooHR", action = "GetJobTitles" });


            //GlobalConfiguration.Configuration.Formatters.JsonFormatter.MediaTypeMappings
            //                    .Add(new RequestHeaderMapping("Accept",
            //                      "text/html",
            //                      StringComparison.InvariantCultureIgnoreCase,
            //                      true,
            //                      "application/json"));
            config.Formatters.JsonFormatter
            .SerializerSettings
            .ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;

            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));
        }
    }
}
