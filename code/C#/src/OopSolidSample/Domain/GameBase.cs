using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SQLite;

namespace OopSolidSample.Domain
{
    public abstract class GameBase
    {
        public static IList<Type> AvailableGameTypes = new[] {typeof (DrawFiveGame), typeof (BlackjackGame)};

        public abstract string Name { get; }
        public abstract DrawResult Draw();
        public abstract IList<HighScore> GetHighScores();
        public abstract void SaveScore(string name, int score);
    }
}