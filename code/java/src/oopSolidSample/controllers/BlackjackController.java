package oopSolidSample.controllers;

import oopSolidSample.domain.BlackjackGame;
import oopSolidSample.domain.Card;
import oopSolidSample.domain.DrawResult;
import oopSolidSample.models.blackjack.BlackjackDrawViewModel;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Blackjack.spr")
public class BlackjackController
{
	@RequestMapping(method = RequestMethod.GET)
	public String Index()
	{
		return "blackjack/Index";	
    }

	@RequestMapping(method = RequestMethod.POST)
    public ModelAndView Draw()
    {
		BlackjackDrawViewModel model = new BlackjackDrawViewModel();
		BlackjackGame game = new BlackjackGame();
        DrawResult drawResult = game.Draw();

        for (Card card : drawResult.Cards) {
		   if (!StringUtils.hasLength(model.Cards))
		   {
                model.Cards += ", ";
                model.Cards += card.Description;
		   }
        }

        model.Score = drawResult.Score;
        ModelAndView mav = new ModelAndView("blackjack/Index");
        mav.addObject(model);
        return mav;
    }
}