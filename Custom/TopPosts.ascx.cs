using System;
using System.Collections.Generic;
using System.IO;
using BlogEngine.Core;

namespace BlogEngine.Web.Custom
{

    public partial class TopPosts : System.Web.UI.UserControl
    {
        private readonly string counterPath = System.Web.HttpContext.Current.Server.MapPath("App_Data/") + "counters";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Repeater1.DataSource = GetTopPosts(_top);
                Repeater1.DataBind();
            }
            catch (Exception)
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

        protected List<Counter> GetTopPosts(int items)
        {
            // Check if it is in the cache already
            List<Counter> shortList;
            List<Counter> randomList = null;
            try
            {
                shortList = (List<Counter>)Cache["TopPosts1"];
                randomList = (List<Counter>)Cache["TopPosts1"];
            }
            catch
            {
                shortList = null;
            }

            // Do we need to rebuild it?
            if (shortList == null)
            {
                List<Counter> list = new List<Counter>();
                shortList = new List<Counter>();

                // Check for counters folder
                if (Directory.Exists(counterPath))
                {

                    Random rnd = new Random();
                    // Loop through files and load'em up
                    foreach (string countFile in Directory.GetFiles(counterPath))
                    {
                        using (StreamReader fileRdr = File.OpenText(countFile))
                        {
                            string postID = countFile.Substring(countFile.LastIndexOf('\\') + 1);
                            Counter temp = new Counter(postID.Remove(postID.Length - 4), Int32.Parse(fileRdr.ReadLine()));
                            temp.Random = rnd.Next(1, 1000);
                            list.Add(temp);
                            fileRdr.Close();
                        }
                    }

                    // Sort'em
                    list.Sort(Counter.CompareCount);

                    // Get desired number
                    if (list.Count < items)
                        items = list.Count;

                    //BL:
                    int randomListLength = 40;
                    if (list.Count < randomListLength)
                        randomListLength = list.Count;


                    for (int i = 0; i < randomListLength; i++)
                    {
                        shortList.Add(list[i]);
                    }

                    shortList.Sort(Counter.CompareRandom);

                    randomList = new List<Counter>();

                    for (int i = 0; i < items; i++)
                    {
                        randomList.Add(shortList[i]);
                    }
                }

                // Add to Cache
                Cache.Insert("TopPosts1", randomList, null, DateTime.Now.AddMinutes(30), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            return randomList;
        }

        protected string GetPage(object o)
        {
            Counter temp = (Counter)o;
            Post post = Post.GetPost(temp.ID);
            string link = "<a href=\"" + Utils.AbsoluteWebRoot + "post/" + post.Slug + ".aspx\">" + post.Title + "</a>";
            if (_showViewCount || Page.User.Identity.IsAuthenticated)
                link += " (" + temp.Count + ")";
            return link;
        }

    }
}