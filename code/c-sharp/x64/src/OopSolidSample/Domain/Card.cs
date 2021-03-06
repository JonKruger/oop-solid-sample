using System;

namespace OopSolidSample.Domain
{
    public class Card
    {
        public Rank Rank { get; set; }
        public Suit Suit { get; set; }

        public string Description
        {
            get { return string.Format("{0} of {1}", Rank, Suit); }
        }
    }
}