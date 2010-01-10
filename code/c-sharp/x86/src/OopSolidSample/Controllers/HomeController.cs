using System.Linq;
using System.Web.Mvc;
using OopSolidSample.Domain;
using OopSolidSample.Models.Home;

namespace OopSolidSample.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var model = new HomeIndexViewModel();
            
            foreach (var gameType in GameBase.AvailableGameTypes)
            {
                var gameModel = new HomeIndexViewModel.GameViewModel();
                if (gameType == typeof(DrawFiveGame))
                {
                    gameModel.Name = "Draw Five";

                    var game = new DrawFiveGame();
                    var highScores = game.GetHighScores();
                    var highestScore = highScores.FirstOrDefault();

                    if (highestScore != null)
                    {
                        gameModel.HighScoreName = highestScore.Name;
                        gameModel.HighScore = highestScore.Score;
                    }
                    gameModel.Link = "/DrawFive";
                }
                else if (gameType == typeof(BlackjackGame))
                {
                    gameModel.Name = "Blackjack";
                    gameModel.Link = "/Blackjack";
                }

                model.Games.Add(gameModel);
            }

            return View(model);
        }
    }
}