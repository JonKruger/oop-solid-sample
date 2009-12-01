using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.Configuration;

namespace OopSolidSample.Domain
{
    public class DrawFiveGame : GameBase
    {
        public override string Name
        {
            get { return "Draw Five"; }
        }

        public override DrawResult Draw()
        {
            var deck = new List<Card>();

            foreach (Rank rank in Enum.GetValues(typeof (Rank)))
            {
                if (rank != Rank.Joker)
                {
                    foreach (Suit suit in Enum.GetValues(typeof (Suit)))
                    {
                        deck.Add(new Card {Rank = rank, Suit = suit});
                    }
                }
                else
                {
                    deck.Add(new Card {Rank = rank});
                }
            }

            var hand = new List<Card>();
            var random = new Random();
            for (var i = 0; i < 5; i++)
            {
                var card = deck[random.Next(0, deck.Count - 1)];
                hand.Add(card);
                deck.Remove(card);
            }

            var score = 0;
            var numberOfCardsByRankDictionary = new Dictionary<Rank, int>();

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
                        score += 15;
                        break;
                    case Rank.Joker:
                        score += 20;
                        break;
                }

                if (card.Suit == Suit.Spades)
                    score += 1;

                var v = 0;
                if (numberOfCardsByRankDictionary.ContainsKey(card.Rank))
                    v = numberOfCardsByRankDictionary[card.Rank];
                numberOfCardsByRankDictionary[card.Rank] = v + 1;
            }

            foreach (var cardsByRank in numberOfCardsByRankDictionary)
            {
                if (cardsByRank.Key != Rank.Joker)
                {
                    if (cardsByRank.Value == 2)
                        score += 50;
                    else if (cardsByRank.Value == 3)
                        score += 150;
                    else if (cardsByRank.Value == 4)
                        score += 300;
                }
                else
                {
                    if (cardsByRank.Value == 2)
                        score += 200;
                }
            }

            return new DrawResult {Score = score, Cards = hand};
        }

        public override IList<HighScore> GetHighScores()
        {
            var highScores = new List<HighScore>();
            using (var connection = new SQLiteConnection(ConfigurationManager.ConnectionStrings["DrawFiveConnectionString"].ConnectionString))
            {
                connection.Open();

                var cmd = connection.CreateCommand();
                cmd.CommandText = "select Name, Score from HighScores order by Score desc limit 5";
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    var name = (string) reader["Name"];
                    var score = (int) reader["Score"];

                    highScores.Add(new HighScore {Name = name, Score = score});
                }
            }
            return highScores;
        }

        public override void SaveScore(string name, int score)
        {
            using (var connection = new SQLiteConnection(ConfigurationManager.ConnectionStrings["DrawFiveConnectionString"].ConnectionString))
            {
                connection.Open();

                var cmd = connection.CreateCommand();
                cmd.CommandText = "insert into HighScores (Name, Score) values (@name, @score)";
                cmd.Parameters.Add(new SQLiteParameter("name", name));
                cmd.Parameters.Add(new SQLiteParameter("score", score));
                cmd.ExecuteNonQuery(); 
            }
        }
    }
}