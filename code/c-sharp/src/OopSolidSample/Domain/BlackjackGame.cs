using System;
using System.Collections.Generic;

namespace OopSolidSample.Domain
{
    public class BlackjackGame : GameBase
    {
        public override string Name
        {
            get { return "Blackjack"; }
        }

        public override DrawResult Draw()
        {
            var deck = new List<Card>();

            foreach (Rank rank in Enum.GetValues(typeof(Rank)))
            {
                foreach (Suit suit in Enum.GetValues(typeof (Suit)))
                {
                    deck.Add(new Card {Rank = rank, Suit = suit});
                }
            }

            var hand = new List<Card>();
            var random = new Random();
            for (var i = 0; i < 2; i++)
            {
                var card = deck[random.Next(0, deck.Count - 1)];
                hand.Add(card);
                deck.Remove(card);
            }

            var score = 0;

            foreach (var card in hand)
            {
                switch (card.Rank)
                {
                    case Rank.Two:
                        score += 2;
                        break;
                    case Rank.Three:
                        score += 3;
                        break;
                    case Rank.Four:
                        score += 4;
                        break;
                    case Rank.Five:
                        score += 5;
                        break;
                    case Rank.Six:
                        score += 6;
                        break;
                    case Rank.Seven:
                        score += 7;
                        break;
                    case Rank.Eight:
                        score += 8;
                        break;
                    case Rank.Nine:
                        score += 9;
                        break;
                    case Rank.Ten:
                    case Rank.Jack:
                    case Rank.Queen:
                    case Rank.King:
                        score += 10;
                        break;
                    case Rank.Ace:
                        score += 11;
                        break;
                }
            }

            return new DrawResult { Score = score, Cards = hand };
        }

        public override IList<HighScore> GetHighScores()
        {
            throw new NotSupportedException();
        }

        public override void SaveScore(string name, int score)
        {
            throw new NotSupportedException();
        }
    }
}