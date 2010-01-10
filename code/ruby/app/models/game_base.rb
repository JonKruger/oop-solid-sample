class GameBase
  AVAILABLE_GAME_TYPES = ['DrawFiveGame', 'BlackjackGame']

  def name
    raise 'not implemented'
  end

  def draw
    raise 'not implemented'
  end

  def get_high_scores
    raise 'not implemented'
  end

  def save_score
    raise 'not implemented'
  end
end