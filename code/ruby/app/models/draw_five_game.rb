class DrawFiveGame
  def Name
    "Draw Five"
  end

  def draw
    deck = Array.new

    Rank.all.each { |rank|
      Suit.all.each { |suit|
        card = Card.new
        card.rank = rank
        card.suit = suit
        deck << card
      }
    }

    hand = Array.new
    5.times do
      card = deck[rand(deck.length)]
      hand << card
      deck.delete(card)
    end

    score = 0
    number_of_cards_by_rank = Hash.new

    hand.each {|card|
      case card.rank
        when Rank::TWO
          score += 2
        when Rank::THREE
          score += 3
        when Rank::FOUR
          score += 4
        when Rank::FIVE
          score += 5
        when Rank::SIX
          score += 6
        when Rank::SEVEN
          score += 7
        when Rank::EIGHT
          score += 8
        when Rank::NINE
          score += 9
        when Rank::TEN
          score += 10
        when Rank::JACK
          score += 10
        when Rank::QUEEN
          score += 10
        when Rank::KING
          score += 10
        when Rank::ACE
          score += 15
      end

      if card.suit == Suit::SPADES
        score += 1
      end

      v = 0
      if (number_of_cards_by_rank.has_key? card.rank)
        v = number_of_cards_by_rank[card.rank]
      end
      number_of_cards_by_rank[card.rank] = v + 1
    }

    number_of_cards_by_rank.each_key {|key|
      cards_by_rank = number_of_cards_by_rank[key]
      if cards_by_rank == 2
        score += 50
      elsif cards_by_rank == 3
        score += 150
      elsif cards_by_rank == 4
        score += 300
      end
    }

    result = DrawResult.new
    result.score = score
    result.cards = hand
    return result
  end

  def get_high_scores
    return HighScore.find(:all, :limit => 5, :order => "score desc")
  end

  def save_score(name, score)
    high_score = HighScore.new
    high_score.name = name
    high_score.score = score
    high_score.save
  end
  
end