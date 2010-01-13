package oopSolidSample.models.drawFive;

import java.util.List;

import oopSolidSample.domain.HighScore;

public class DrawFiveHighScoresViewModel
{
    public List<HighScore> highScores;

	public List<HighScore> getHighScores() {
		return highScores;
	}

	public void setHighScores(List<HighScore> highScores) {
		this.highScores = highScores;
	}
}
