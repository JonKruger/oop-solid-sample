package oopSolidSample.models.home;

import java.util.ArrayList;
import java.util.List;

public class HomeIndexViewModel
{
    public class GameViewModel
    {
        public String Name;
        public String Link;
        public String HighScoreName;
        public int HighScore;
    }

    public List<GameViewModel> Games;

    public HomeIndexViewModel()
    {
        Games = new ArrayList<GameViewModel>();
    }
}