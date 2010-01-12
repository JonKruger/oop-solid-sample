package oopSolidSample.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;

import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

public class DrawFiveGame extends GameBase
{
	JdbcTemplate sql;
	public DrawFiveGame() 
	{
        try {
			Class.forName("org.sqlite.JDBC");
	        String connectionString = "jdbc:sqlite:D:/sqllite/oopSolidSample.db3";
	        Connection connection = DriverManager.getConnection(connectionString);
	    	SingleConnectionDataSource ds = new SingleConnectionDataSource(connection, true);
	    	sql = new JdbcTemplate(ds);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String getName()
    {
        return "Draw Five";
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
        for (int i = 0; i < 5; i++)
        {
            Card card = deck.remove(random.nextInt(deck.size()));
            hand.add(card);
        }

        int score = 0;
        Map<Rank, Integer> numberOfCardsByRankDictionary = new HashMap();

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
                    score += 15;
                    break;
            }

            if (card.Suit == Suit.Spades)
                score += 1;

            int v = 0;
            if (numberOfCardsByRankDictionary.containsKey(card.Rank))
                v = numberOfCardsByRankDictionary.get(card.Rank);
            	numberOfCardsByRankDictionary.put(card.Rank, v + 1);
        }

        for (Entry<Rank, Integer> cardsByRank : numberOfCardsByRankDictionary.entrySet())
        {
            if (cardsByRank.getValue() == 2)
                score += 50;
            else if (cardsByRank.getValue() == 3)
                score += 150;
            else if (cardsByRank.getValue() == 4)
                score += 300;
        }

        return new DrawResult(score, hand);
    }
    @Override
    public List<HighScore> GetHighScores()
    {
        List<HighScore> highScores = new ArrayList<HighScore>();
        RowMapper rowMapper = new ColumnMapRowMapper();
        List<Map> rows = (List<Map>) sql.query("select Name, Score from HighScores order by Score desc limit 5",
				new RowMapperResultSetExtractor(rowMapper));
		for (Map row : rows)
		{
			String name = (String) row.get("Name");
			int score = Integer.parseInt((String) row.get("Score"));
            highScores.add(new HighScore(name, score));
        }
        return highScores;
    }
    @Override
    public void SaveScore(String name, int score)
    {        
    	sql.update("insert into HighScores (Name, Score) " +
				   "values ('" + name + "', '" + score + "')");
    }
}