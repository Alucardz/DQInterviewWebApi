

using System;
using ScrapySharp.Core;
using ScrapySharp.Html.Parsing;
using HtmlAgilityPack;
using ScrapySharp.Network;
using ScrapySharp.Html.Forms;
using ScrapySharp.Extensions;
using System.Linq;
using ScrapySharp.Html;
using System.Collections.Generic;

namespace ConsoleTester
{
    class Program
    {
        static void Main(string[] args)
        {
            var LDAPClient = new LDAPClient.LDAPApi("joseph-s", "dq.com.lb", "squarerules", "dc1.dq.com.lb");

            var searchResult = LDAPClient.search("CN=Users,DC=dq,DC=com,DC=lb", "sAMAccountName=joseph-s");

            Console.WriteLine(searchResult[0]["mail"]);
            Console.WriteLine(searchResult[0]["displayname"]);

            #region Scrapping Test
            //ScrapingBrowser browser = new ScrapingBrowser();

            //set UseDefaultCookiesParser as false if a website returns invalid cookies format
            //browser.UseDefaultCookiesParser = false;

            //WebPage homePage = browser.NavigateToPage(new Uri("https://dataquest.bamboohr.com/applicant_tracking/list_position"));

            //PageWebForm form = homePage.FindFormById("sb_form");
            //form["q"] = "scrapysharp";
            //form.Method = HttpVerb.Get;
            //WebPage resultsPage = form.Submit();

            //HtmlNode[] resultsLinks = resultsPage.Html.CssSelect("div.sb_tlst h3 a").ToArray();

            //WebPage blogPage = resultsPage.FindLinks(By.Text("romcyber blog | Just another WordPress site")).Single().Click();
            #endregion

        }
    }
}
