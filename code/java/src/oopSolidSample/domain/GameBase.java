package oopSolidSample.domain;

import java.util.List;

public abstract class GameBase
{
    public static Class[] AvailableGameTypes = { DrawFiveGame.class, BlackjackGame.class };
    public abstract String getName();
    public abstract DrawResult Draw();
    public abstract List<HighScore> GetHighScores();
    public abstract void SaveScore(String name, int score);
}