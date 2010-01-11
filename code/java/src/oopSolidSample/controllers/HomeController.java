package oopSolidSample.controllers;

import java.util.List;

import oopSolidSample.domain.BlackjackGame;
import oopSolidSample.domain.DrawFiveGame;
import oopSolidSample.domain.GameBase;
import oopSolidSample.domain.HighScore;
import oopSolidSample.models.home.HomeIndexViewModel;

import org.springframework.web.servlet.ModelAndView;


public class HomeController
{
    public ModelAndView Index()
    {
    	HomeIndexViewModel model = new HomeIndexViewModel();
        
        for (Class gameType : GameBase.AvailableGameTypes)
        {
        	HomeIndexViewModel.GameViewModel gameModel = (new HomeIndexViewModel()).new GameViewModel();
            if (gameType == DrawFiveGame.class)
            {
                gameModel.Name = "Draw Five";

                DrawFiveGame game = new DrawFiveGame();
                List<HighScore> highScores = game.GetHighScores();
                HighScore highestScore = highScores.get(0);

                if (highestScore != null)
                {
                    gameModel.HighScoreName = highestScore.Name;
                    gameModel.HighScore = highestScore.Score;
                }
                gameModel.Link = "/DrawFive";
            }
            else if (gameType == BlackjackGame.class)
            {
                gameModel.Name = "Blackjack";
                gameModel.Link = "/Blackjack";
            }

            model.Games.add(gameModel);
        }
		ModelAndView mav = new ModelAndView();
		mav.addObject(model);
        return mav;
    }
}