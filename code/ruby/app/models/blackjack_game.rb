class BlackjackGame < GameBase
  def name
    "Blackjack"
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
    2.times do
      card = deck[rand(deck.length)]
      hand << card
      deck.delete(card)
    end

    score = 0
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
          score += 11
      end
    }

    result = DrawResult.new
    result.score = score
    result.cards = hand
    return result
  end
end