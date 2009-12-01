using System.Collections.Generic;

namespace OopSolidSample.Domain
{
    public class DrawResult
    {
        public IList<Card> Cards { get; set;}
        public int Score { get; set; }
    }
}