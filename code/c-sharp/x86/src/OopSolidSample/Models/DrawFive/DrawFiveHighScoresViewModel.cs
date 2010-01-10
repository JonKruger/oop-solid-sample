using System.Collections.Generic;
using OopSolidSample.Domain;

namespace OopSolidSample.Models.DrawFive
{
    public class DrawFiveHighScoresViewModel
    {
        public IList<HighScore> HighScores { get; set; }
    }
}