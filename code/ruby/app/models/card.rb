class Card
  attr :rank, true
  attr :suit, true

  def description
    "#{rank} of #{suit}"
  end
end