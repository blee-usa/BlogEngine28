using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogEngine.Web.Custom
{
    public class Counter
    {
        public Counter(string id, int count)
        {
            _id = new Guid(id);
            _count = count;


        }

        private Guid _id;

        public Guid ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private int _count;

        public int Count
        {
            get { return _count; }
            set { _count = value; }
        }

        private int _random = 0;

        public int Random
        {
            get { return _random; }
            set { _random = value; }
        }

        public static int CompareRandom(Counter x, Counter y)
        {
            // Descending Order!!!
            if (x == null)
            {
                if (y == null)
                {
                    // If x is null and y is null, they're equal. 
                    return 0;
                }
                else
                {
                    // If x is null and y is not null, y is greater. 
                    return 1;
                }
            }
            else
            {
                // If x is not null...
                //
                if (y == null)
                // ...and y is null, x is greater.
                {
                    return -1;
                }
                else
                {
                    // ...and y is not null, we need some additional checks
                    if (x.Random > y.Random)
                        return -1;
                    else if (x.Random == y.Random)
                        return 0;
                    else
                        return 1;

                }
            }
        }

        public static int CompareCount(Counter x, Counter y)
        {
            // Descending Order!!!
            if (x == null)
            {
                if (y == null)
                {
                    // If x is null and y is null, they're equal. 
                    return 0;
                }
                else
                {
                    // If x is null and y is not null, y is greater. 
                    return 1;
                }
            }
            else
            {
                // If x is not null...
                //
                if (y == null)
                // ...and y is null, x is greater.
                {
                    return -1;
                }
                else
                {
                    // ...and y is not null, we need some additional checks
                    if (x.Count > y.Count)
                        return -1;
                    else if (x.Count == y.Count)
                        return 0;
                    else
                        return 1;

                }
            }
        }
    }
}