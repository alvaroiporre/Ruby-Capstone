require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @cover_state = last_played_at
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(last_played_at.to_s)
    difference = (now - before).to_i
    difference_year = difference / 365
    super && difference_year > 2
  end
end
