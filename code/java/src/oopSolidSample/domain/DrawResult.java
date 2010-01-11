package oopSolidSample.domain;

import java.util.List;

public class DrawResult
{
    public DrawResult(int score2, List<Card> hand) {
		Score = score2;
		Cards = hand;
	}
	public List<Card> Cards;
    public int Score;
}