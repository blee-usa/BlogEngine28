using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace BlogEngine.Web.Custom
{
    public class Helpers
    {
        //public static List<Uri> FetchAllImageSources(string htmlSource)
        //{
        //    var regexImgSrc = @"<img[^>]*?src\s*=\s*[""']?([^'"" >]+?)[ '""][^>]*?>";
        //    MatchCollection matchesImgSrc = Regex.Matches(htmlSource, regexImgSrc, RegexOptions.IgnoreCase | RegexOptions.Singleline);
        //    return (from Match m in matchesImgSrc select m.Groups[1].Value into href select new Uri(href)).ToList();
        //}

        //public static Uri FetchFirstImageSource(string htmlSource)
        //{
        //    var allImages = FetchAllImageSources(htmlSource);
        //    return allImages.Any() ? allImages[0] : null;
        //}

        public static string RemoveImages(string htmlSource)
        {
            var regexImg = @"<img[^>]*[/>]";
            return Regex.Replace(htmlSource, regexImg, "");
        }

        public static List<string> FetchAllImageSources(string htmlSource)
        {
            var regexImgSrc = @"<img[^>]*?src\s*=\s*[""']?([^'"" >]+?)[ '""][^>]*?>";
            MatchCollection matchesImgSrc = Regex.Matches(htmlSource, regexImgSrc, RegexOptions.IgnoreCase | RegexOptions.Singleline);
            return (from Match m in matchesImgSrc select m.Groups[1].Value).ToList();
        }

        public static string FetchFirstImageSource(string htmlSource)
        {
            var allImages = FetchAllImageSources(htmlSource);
            return allImages.Any() ? allImages[0] : null;
        }
    }
}