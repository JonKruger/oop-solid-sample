package oopSolidSample.domain;

public class Card
{
    public Rank Rank;
    public Suit Suit;

    public Card(Rank rank2, Suit suit2) {
		Rank = rank2;
		Suit = suit2;
	}
	public String getDescription()
    {
		return Rank + " of " + Suit;
    }
}