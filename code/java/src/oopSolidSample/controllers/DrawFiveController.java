package oopSolidSample.controllers;

import oopSolidSample.domain.Card;
import oopSolidSample.domain.DrawFiveGame;
import oopSolidSample.domain.DrawResult;
import oopSolidSample.models.drawFive.DrawFiveDrawViewModel;
import oopSolidSample.models.drawFive.DrawFiveHighScoresViewModel;
import oopSolidSample.models.drawFive.DrawFiveSaveScoreUpdateModel;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DrawFiveController
{
	@RequestMapping("/DrawFive/Index.spr")
    public ModelAndView Index()
    {
    	DrawFiveDrawViewModel model = new DrawFiveDrawViewModel();
        ModelAndView mav = new ModelAndView("drawFive/Index");
        mav.addObject(model);
        return mav;
    }

    @RequestMapping("/DrawFive/Draw.spr")
    public ModelAndView Draw()
    {
    	DrawFiveDrawViewModel model = new DrawFiveDrawViewModel();
        DrawFiveGame game = new DrawFiveGame();
        DrawResult drawResult = game.Draw();
        
        for(Card card : drawResult.Cards)
        {
            if (StringUtils.hasLength(model.getCards()))
                model.setCards(model.getCards() + ", ");
            model.setCards(model.getCards() + card.getDescription());
        }

        model.setScore(drawResult.Score);
        ModelAndView mav = new ModelAndView("drawFive/Draw");
        mav.addObject("model", model);
        return mav;
    }

    @RequestMapping("/DrawFive/HighScores.spr")
    public ModelAndView HighScores()
    {
    	DrawFiveGame game = new DrawFiveGame();
    	DrawFiveHighScoresViewModel model = new DrawFiveHighScoresViewModel();
        model.setHighScores(game.GetHighScores());
        ModelAndView mav = new ModelAndView("drawFive/HighScores");
        mav.addObject("model", model);
        return mav;
    }

    @RequestMapping("/DrawFive/SaveScore.spr")
    public ModelAndView SaveScore(DrawFiveSaveScoreUpdateModel model)
    {
    	DrawFiveGame game = new DrawFiveGame();
        game.SaveScore(model.getName(), model.getScore());
        return new ModelAndView("drawFive/HighScores");
    }
}