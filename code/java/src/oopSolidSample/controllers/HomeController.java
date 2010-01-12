package oopSolidSample.controllers;

import oopSolidSample.domain.BlackjackGame;
import oopSolidSample.domain.DrawFiveGame;
import oopSolidSample.domain.GameBase;
import oopSolidSample.domain.HighScore;
import oopSolidSample.models.home.HomeIndexViewModel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Index.spr")
public class HomeController
{
	@RequestMapping(method = RequestMethod.GET)
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
                //List<HighScore> highScores = game.GetHighScores();
                HighScore highestScore = null;//highScores.get(0);

                if (highestScore != null)
                {
                    gameModel.HighScoreName = highestScore.Name;
                    gameModel.HighScore = highestScore.Score;
                }
                gameModel.Link = "DrawFive.spr";
            }
            else if (gameType == BlackjackGame.class)
            {
                gameModel.Name = "Blackjack";
                gameModel.Link = "Blackjack.spr";
            }

            model.Games.add(gameModel);
        }
		ModelAndView mav = new ModelAndView("home/Index");
		mav.addObject("model", model);
        return mav;
    }
}