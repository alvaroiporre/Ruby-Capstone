require 'date'

class Item
  attr_accessor :genre, :author, :label
  attr_reader :publish_date

  def initialize(publish_date)
    @id = rand(0..1000)
    @publish_date = publish_date
    @archived = false
    @genre = nil
    @author = nil
    @label = nil
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(publish_date.to_s)
    difference = (now - before).to_i
    difference_year = difference / 365
    difference_year < 10
  end

  def move_to_archive()
    @archived = can_be_archived?
  end
end
