class DrawFiveController < ApplicationController
  def index

  end

  def draw
    game = DrawFiveGame.new
    draw_result = game.draw

    @cards = ''
    draw_result.cards.each {|card|
      if @cards.length > 0
        @cards += ', '
      end
      @cards += card.description
    }

    @score = draw_result.score
    @name = ''
  end

  def highscores
    game = DrawFiveGame.new
    @high_scores = game.get_high_scores
  end

  def savescore
    game = DrawFiveGame.new
    game.save_score(params[:name], params[:score])
    redirect_to url_for :action => 'highscores'
  end
end
