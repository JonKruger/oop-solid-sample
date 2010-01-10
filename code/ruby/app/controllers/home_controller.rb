class HomeController < ApplicationController
  def index
    @games = Array.new
    GameBase::AVAILABLE_GAME_TYPES.each {|type|
      game_summary = GameSummary.new
      if (type == 'DrawFiveGame')
        game_summary.name = 'Draw Five'

        game = DrawFiveGame.new
        high_scores = game.get_high_scores
        highest_score = high_scores.length > 0 ? high_scores[0] : nil

        if (highest_score != nil)
          game_summary.high_score_name = highest_score.name
          game_summary.high_score = highest_score.score
        end
        game_summary.link = '/Draw_Five/index'
      elsif (type == 'BlackjackGame')
        game_summary = GameSummary.new
        game_summary.name = 'Blackjack'
        game_summary.link = '/Blackjack/index'
      end
      @games << game_summary
    }
  end
end
