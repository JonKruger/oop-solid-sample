using System.Web.Mvc;
using MvcContrib.Attributes;
using OopSolidSample.Domain;
using OopSolidSample.Models.Blackjack;

namespace OopSolidSample.Controllers
{
    public class BlackjackController : Controller
    {
        [AcceptGet]
        public ActionResult Index()
        {
            var model = new BlackjackDrawViewModel();

            return View();
        }

        [AcceptPost]
        public ActionResult Draw()
        {
            var model = new BlackjackDrawViewModel();
            var game = new BlackjackGame();
            var drawResult = game.Draw();

            foreach (var card in drawResult.Cards)
            {
                if (!string.IsNullOrEmpty(model.Cards))
                    model.Cards += ", ";
                model.Cards += card.Description;
            }

            model.Score = drawResult.Score;
            return View(model);
        }
    }
}