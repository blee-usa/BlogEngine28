using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace BlogEngine.Web.Custom
{
    public partial class Delicious : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }

        protected void GetData()
        {
            try
            {
                List<FeedItem> feedItems = null;

                if (Cache["delicious"] != null)
                {
                    feedItems = Cache["delicious"] as List<FeedItem>;
                }
                else
                {
                    XmlDocument xmlDoc = new XmlDocument();
                    XmlTextReader xmlTextReader = new XmlTextReader("http://www.delicious.com/v2/rss/soul_stops");

                    xmlDoc.Load(xmlTextReader);
                    feedItems = new List<FeedItem>();
                    foreach (XmlNode feedItem in xmlDoc.SelectNodes("//item"))
                    {
                        feedItems.Add(new FeedItem(feedItem));
                    }
                    Cache.Insert("delicious", feedItems, null, DateTime.Now.AddHours(1), Cache.NoSlidingExpiration,
                                 CacheItemPriority.Normal, null);
                }


                if (feedItems != null && feedItems.Count > 0)
                {

                    int count = int.Parse(hfCount.Value);

                    if (count > feedItems.Count)
                        count = feedItems.Count;

                    Repeater1.DataSource = feedItems.GetRange(0, count);
                    Repeater1.DataBind();


                    if (count >= feedItems.Count)
                        lbMore.Visible = false;
                }
                else
                {
                    phDeli.Visible = false;
                }
            }
            catch (Exception ex)
            {

                phDeli.Visible = false;
            }
        }

        protected void lbMore_Click(object sender, EventArgs e)
        {
            int count = int.Parse(hfCount.Value);
            hfCount.Value = (count + 5).ToString();
            GetData();
        }
    }

    public class FeedItem
    {
        private string _title;

        public string Title
        {
            get { return _title; }
        }

        private string _url;

        public string Url
        {
            get { return _url; }
        }

        private string _description;

        public string Description
        {
            get { return _description; }
        }

        public FeedItem(XmlNode xmlNode)
        {
            _title = xmlNode.SelectSingleNode("title").InnerText;
            _url = xmlNode.SelectSingleNode("link").InnerText.Replace("#disqus_thread", "");
            _description = xmlNode.SelectSingleNode("description").InnerText;
        }
    }
}