using System.Collections.Generic;

namespace OopSolidSample.Models.Home
{
    public class HomeIndexViewModel
    {
        public class GameViewModel
        {
            public string Name { get; set; }
            public string Link { get; set; }
            public string HighScoreName { get; set; }
            public int? HighScore { get; set; }
        }

        public IList<GameViewModel> Games { get; set; }

        public HomeIndexViewModel()
        {
            Games = new List<GameViewModel>();
        }
    }
}