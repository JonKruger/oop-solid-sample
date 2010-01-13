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
public class BlackjackController
{
	@RequestMapping("/Blackjack/Index.spr")
	public String Index()
	{
		return "blackjack/Index";	
    }


	@RequestMapping("/Blackjack/Draw.spr")
    public ModelAndView Draw()
    {
		BlackjackDrawViewModel model = new BlackjackDrawViewModel();
		BlackjackGame game = new BlackjackGame();
        DrawResult drawResult = game.Draw();

        model.setCards("");
        for (Card card : drawResult.Cards) 
        {
        	if (StringUtils.hasLength(model.getCards()))
                model.setCards(model.getCards() + ", ");
            model.setCards(model.getCards() + card.getDescription());
        }

        model.setScore(drawResult.Score);
        ModelAndView mav = new ModelAndView("blackjack/Draw");
        mav.addObject("model", model);
        return mav;
    }
}