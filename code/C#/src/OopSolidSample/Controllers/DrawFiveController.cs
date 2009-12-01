using System.Web.Mvc;
using OopSolidSample.Domain;
using OopSolidSample.Models.DrawFive;
using MvcContrib.Attributes;
using MvcContrib;

namespace OopSolidSample.Controllers
{
    public class DrawFiveController : Controller
    {
        [AcceptGet]
        public ActionResult Index()
        {
            var model = new DrawFiveDrawViewModel();

            return View();
        }

        [AcceptPost]
        public ActionResult Draw()
        {
            var model = new DrawFiveDrawViewModel();
            var game = new DrawFiveGame();
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

        public ActionResult HighScores()
        {
            var game = new DrawFiveGame();
            var model = new DrawFiveHighScoresViewModel();
            model.HighScores = game.GetHighScores();
            return View(model);
        }

        [AcceptPost]
        public ActionResult SaveScore(DrawFiveSaveScoreUpdateModel model)
        {
            var game = new DrawFiveGame();
            game.SaveScore(model.Name, model.Score);
            return this.RedirectToAction(c => c.HighScores());
        }
    }
}