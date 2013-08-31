using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using BlogEngine.Core;

namespace BlogEngine.Web.Custom
{
    public partial class Quotes : System.Web.UI.UserControl
    {
        private string dataSource;

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                dataSource = System.Web.HttpContext.Current.Server.MapPath("App_Data/") + "quotes.xml";

                if (!IsPostBack)
                {
                    ShowQuote();
                }
            }
            catch (Exception ex)
            {

                //throw;
            }
        }

        private void ShowQuote()
        {
            Quote current = GetCurrentQuote();
            HfQuoteID.Value = current.ID.ToString();
            LblQuote.Text = current.Content;
            LblSource.Text = current.Source;
        }

        private Quote GetCurrentQuote()
        {
            // Get all Quotes
            List<Quote> quotes = GetQuotes();

            // Check for today's quote
            bool update = true;
            Quote current = new Quote();
            // Ok, we're gonna loop through all the quotes/
            foreach (Quote quote in quotes)
            {
                try
                {


                    // do we have one marked for today?
                    if (quote.LastDisplayed == DateTime.Now.Date)
                    {
                        current = quote;
                        update = false;
                        break;
                    }
                    else
                    {
                        // Always grab the oldest quote out there.
                        if (current.LastDisplayed > quote.LastDisplayed)
                            current = quote;
                    }
                }
                catch
                {

                }
            }

            if (update)
            {
                // New quote selected.  Change the Date.
                current.LastDisplayed = DateTime.Now.Date;
                SaveQuotes(current, quotes, QuoteAction.Update);
            }

            return current;

        }

        private List<Quote> GetQuotes()
        {
            // Check if it is in the cache already
            List<Quote> quotes = (List<Quote>) Cache["quotes"];

            if (quotes == null)
            {
                // Initialize it
                quotes = new List<Quote>();

                // Read them in
                if (!File.Exists(dataSource))
                {
                    // Load initial entry
                    int id = 1;
                    string source = "Proverbs 26:12";
                    string content =
                        "\"Do you see a man wise in his own eyes? There is more hope for a fool than for him.\"";
                    DateTime lastDisplayed = DateTime.MinValue;
                    quotes.Add(new Quote(id, source, content, lastDisplayed));
                }
                else
                {
                    XmlDocument doc = new XmlDocument();
                    doc.Load(dataSource);

                    foreach (XmlNode node in doc.SelectNodes("Quotes/Quote"))
                    {
                        int id = int.Parse(node.SelectSingleNode("id").InnerText);
                        string source = node.SelectSingleNode("Source").InnerText;
                        string content = node.SelectSingleNode("Contents").InnerText;


                        DateTime lastDisplayed = DateTime.Now;


                        if (!DateTime.TryParse(node.SelectSingleNode("LastDisplayed").InnerText, out lastDisplayed))
                        {
                            lastDisplayed = DateTime.Now;
                        }

                        Quote temp = new Quote(id, source, content, lastDisplayed);

                        quotes.Add(temp);
                    }
                }
                // Add it to the cache.  We don't want to do that too often.
                Cache.Insert("quotes", quotes, new System.Web.Caching.CacheDependency(dataSource),
                             DateTime.Now.Date.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            return quotes;
        }

        private void SaveQuotes(Quote edit, List<Quote> quotes, QuoteAction action)
        {
            int currentID = 0;
            // Update quotes
            using (XmlTextWriter writer = new XmlTextWriter(dataSource, System.Text.Encoding.UTF8))
            {
                writer.Formatting = Formatting.Indented;
                writer.Indentation = 4;
                writer.WriteStartDocument(true);
                writer.WriteStartElement("Quotes");

                foreach (Quote quote in quotes)
                {
                    currentID = quote.ID;

                    if (currentID == edit.ID)
                    {
                        if (action == QuoteAction.Update)
                        {
                            if (edit.LastDisplayed == DateTime.MinValue)
                                edit.LastDisplayed = quote.LastDisplayed; // Use quote to get actual date 
                            WriteQuote(writer, edit);
                        }
                        // else if (action == QuoteAction.Delete) do nothing.  We don't want to write it back out
                    }
                    else
                    {
                        WriteQuote(writer, quote);
                    }
                }

                if (edit.ID == 0 && action == QuoteAction.Update)
                {
                    // We need to add a new one
                    currentID++;
                    edit.ID = currentID;
                    WriteQuote(writer, edit);
                }

                writer.WriteEndElement();
            }
        }

        private static void WriteQuote(XmlTextWriter writer, Quote quote)
        {
            writer.WriteStartElement("Quote");

            writer.WriteStartElement("id");
            writer.WriteValue(quote.ID.ToString());
            writer.WriteEndElement();
            writer.WriteStartElement("Source");
            writer.WriteValue(quote.Source);
            writer.WriteEndElement();
            writer.WriteStartElement("Contents");
            writer.WriteValue(quote.Content);
            writer.WriteEndElement();
            writer.WriteStartElement("LastDisplayed");
            writer.WriteValue(quote.LastDisplayed.ToShortDateString());
            writer.WriteEndElement();

            writer.WriteEndElement();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            PnlActions.Enabled = false;
            PnlEditor.Visible = true;
            HfEditID.Value = "0";
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            PnlActions.Enabled = false;
            PnlEditor.Visible = true;
            TxtContent.Text = LblQuote.Text;
            TxtSource.Text = LblSource.Text;
            HfEditID.Value = HfQuoteID.Value;
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            PnlActions.Enabled = false;

            List<Quote> quotes = GetQuotes();
            if (quotes.Count > 1)
                PnlDelete.Visible = true;
            else
                PnlError.Visible = true;
        }

        protected void BtnPrev_Click(object sender, EventArgs e)
        {
            int current = int.Parse(HfQuoteID.Value);
            List<Quote> quotes = GetQuotes();

            foreach (Quote quote in quotes)
            {
                if (quote.ID == current)
                    break;
                if (quote.ID < current)
                {
                    HfQuoteID.Value = quote.ID.ToString();
                    LblQuote.Text = quote.Content;
                    LblSource.Text = quote.Source;
                }
            }
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            int current = int.Parse(HfQuoteID.Value);
            List<Quote> quotes = GetQuotes();

            foreach (Quote quote in quotes)
            {
                if (quote.ID > current)
                {
                    HfQuoteID.Value = quote.ID.ToString();
                    LblQuote.Text = quote.Content;
                    LblSource.Text = quote.Source;
                    break;
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            int id = int.Parse(HfEditID.Value);
            Quote temp = new Quote(id, TxtSource.Text, TxtContent.Text, DateTime.MinValue);
            SaveQuotes(temp, GetQuotes(), QuoteAction.Update);
            LblQuote.Text = TxtContent.Text;
            LblSource.Text = TxtSource.Text;
            TxtContent.Text = "";
            TxtSource.Text = "";
            PnlActions.Enabled = true;
            PnlEditor.Visible = false;
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            TxtContent.Text = "";
            TxtSource.Text = "";
            PnlActions.Enabled = true;
            PnlEditor.Visible = false;
        }

        protected void BtnYes_Click(object sender, EventArgs e)
        {
            int id = int.Parse(HfQuoteID.Value);
            Quote temp = new Quote(id, TxtSource.Text, TxtContent.Text, DateTime.MinValue);
            SaveQuotes(temp, GetQuotes(), QuoteAction.Delete);
            ShowQuote();
            PnlActions.Enabled = true;
            PnlDelete.Visible = false;
        }

        protected void BtnNo_Click(object sender, EventArgs e)
        {
            PnlActions.Enabled = true;
            PnlDelete.Visible = false;
        }

        protected void BtnOk_Click(object sender, EventArgs e)
        {
            PnlActions.Enabled = true;
            PnlError.Visible = false;
        }
    }

    /// <summary>
    /// Quote Class used for Quote of the Day Control
    /// </summary>
    public class Quote
    {
        public Quote()
        {
            _id = 0;
            _source = "";
            _content = "";
            _lastDisplayed = DateTime.Now;
        }

        public Quote(int id, string source, string content, DateTime lastDisplayed)
        {
            _id = id;
            _source = source;
            _content = content;
            _lastDisplayed = lastDisplayed;
        }

        private int _id;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _source;

        public string Source
        {
            get { return _source; }
            set { _source = value; }
        }

        private string _content;

        public string Content
        {
            get { return _content; }
            set { _content = value; }
        }

        private DateTime _lastDisplayed;

        public DateTime LastDisplayed
        {
            get { return _lastDisplayed; }
            set { _lastDisplayed = value; }
        }

    }

    public enum QuoteAction
    {
        Update,
        Delete
    }
}