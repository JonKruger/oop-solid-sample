class BlackjackController < ApplicationController
  def index
    
  end

  def draw
    game = BlackjackGame.new
    draw_result = game.draw

    @cards = ''
    draw_result.cards.each {|card|
      if @cards.length > 0
        @cards += ', '
      end
      @cards += card.description
    }

    @score = draw_result.score
  end
end
