using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using BlogEngine.Core;

namespace BlogEngine.Web.Custom
{
    public partial class RecentTopPosts : System.Web.UI.UserControl
    {
        private readonly string counterPath = System.Web.HttpContext.Current.Server.MapPath("App_Data/") + "counters";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Repeater1.DataSource = TopPosts(_top);
                Repeater1.DataBind();
            }
            catch (Exception ex)
            {


            }

        }

        private int _top;

        public int Top
        {
            get { return _top; }
            set { _top = value; }
        }
        private bool _showViewCount;

        public bool ShowViewCount
        {
            get { return _showViewCount; }
            set { _showViewCount = value; }
        }

        protected List<Counter> TopPosts(int items)
        {
            // Check if it is in the cache already
            List<Counter> shortList;
            try
            {
                shortList = (List<Counter>)Cache["RecentTopPosts"];
            }
            catch
            {
                shortList = null;
            }

            try
            {


                // Do we need to rebuild it?
                if (shortList == null || !shortList.Any())
                {
                    List<Counter> list = new List<Counter>();
                    shortList = new List<Counter>();

                    // Check for counters folder
                    if (Directory.Exists(counterPath))
                    {
                        // Loop through files and load'em up
                        foreach (string countFile in Directory.GetFiles(counterPath))
                        {
                            using (StreamReader fileRdr = File.OpenText(countFile))
                            {
                                string postID = countFile.Substring(countFile.LastIndexOf('\\') + 1);
                                Counter temp = new Counter(postID.Remove(postID.Length - 4), Int32.Parse(fileRdr.ReadLine()));
                                list.Add(temp);
                                fileRdr.Close();
                            }
                        }

                        // Sort'em
                        list.Sort(Counter.CompareCount);

                        // Get desired number
                        if (list.Count < items)
                            items = list.Count;

                        int counter = 0;

                        DateTime dtNow = DateTime.Now;

                        for (int i = 0; i < list.Count; i++)
                        {
                            if (counter < _top)
                            {
                                Counter c = list[i];
                                Post p = Post.GetPost(c.ID);

                                try
                                {
                                    System.TimeSpan diffResult = dtNow.Subtract(p.DateCreated);
                                    if (diffResult.Days < 60)
                                    {
                                        shortList.Add(list[i]);
                                        counter++;
                                    }
                                }
                                catch (Exception ex)
                                {
                                    var s = ex.Message;
                                }
                            }
                        }
                    }

                    // Add to Cache
                    Cache.Insert("RecentTopPosts", shortList, null, DateTime.Now.AddMinutes(30), System.Web.Caching.Cache.NoSlidingExpiration);

                }
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
            return shortList;
        }

        protected string GetPage(object o)
        {
            string link = string.Empty;
            try
            {


                Counter temp = (Counter)o;
                Post post = Post.GetPost(temp.ID);
                link = "<a href=\"" + Utils.AbsoluteWebRoot + "post/" + post.Slug + ".aspx\">" + post.Title + "</a>";
                if (_showViewCount || Page.User.Identity.IsAuthenticated)
                    link += " (" + temp.Count + ")";

            }
            catch (Exception)
            {

            }

            return link;
        }

    }
}