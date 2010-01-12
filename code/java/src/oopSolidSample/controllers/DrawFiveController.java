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
@RequestMapping("/DrawFive.spr")
public class DrawFiveController
{
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView Index()
    {
    	DrawFiveDrawViewModel model = new DrawFiveDrawViewModel();
        ModelAndView mav = new ModelAndView("drawFive/Index");
        mav.addObject(model);
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView Draw()
    {
    	DrawFiveDrawViewModel model = new DrawFiveDrawViewModel();
        DrawFiveGame game = new DrawFiveGame();
        DrawResult drawResult = game.Draw();
        
        for(Card card : drawResult.Cards)
        {
            if (StringUtils.hasLength(model.Cards))
                model.Cards += ", ";
            model.Cards += card.Description;
        }

        model.Score = drawResult.Score;
        ModelAndView mav = new ModelAndView("drawFive/Index");
        mav.addObject(model);
        return mav;
    }

    public ModelAndView HighScores()
    {
    	DrawFiveGame game = new DrawFiveGame();
    	DrawFiveHighScoresViewModel model = new DrawFiveHighScoresViewModel();
        model.HighScores = game.GetHighScores();
        ModelAndView mav = new ModelAndView("drawFive/HighScores");
        mav.addObject(model);
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView SaveScore(DrawFiveSaveScoreUpdateModel model)
    {
    	DrawFiveGame game = new DrawFiveGame();
        game.SaveScore(model.Name, model.Score);
        return new ModelAndView("drawFive/HighScores");//TODO: this.RedirectToAction(c => c.HighScores());
    }
}