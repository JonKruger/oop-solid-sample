package oopSolidSample.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class BlackjackGame extends GameBase
{
	@Override
    public String getName()
    {
		return "Blackjack";
	}
    @Override
    public DrawResult Draw()
    {
        List<Card> deck = new ArrayList<Card>();

        for (Rank rank : Rank.values())
        {
            for (Suit suit : Suit.values())
            {
                deck.add(new Card(rank, suit));
            }
        }

        List<Card> hand = new ArrayList<Card>();
        Random random = new Random();
        for (int i = 0; i < 2; i++)
        {
            Card card = deck.remove(random.nextInt(deck.size()));
            hand.add(card);
        }

        int score = 0;

        for (Card card : hand)
        {
            switch (card.Rank)
            {
                case Two:
                    score += 2;
                    break;
                case Three:
                    score += 3;
                    break;
                case Four:
                    score += 4;
                    break;
                case Five:
                    score += 5;
                    break;
                case Six:
                    score += 6;
                    break;
                case Seven:
                    score += 7;
                    break;
                case Eight:
                    score += 8;
                    break;
                case Nine:
                    score += 9;
                    break;
                case Ten:
                case Jack:
                case Queen:
                case King:
                    score += 10;
                    break;
                case Ace:
                    score += 11;
                    break;
            }
        }

        return new DrawResult(score, hand);
    }
    @Override
    public List<HighScore> GetHighScores()
    {
        throw new UnsupportedOperationException();
    }
    @Override
    public void SaveScore(String name, int score)
    {
        throw new UnsupportedOperationException();
    }
}