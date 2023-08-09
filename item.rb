require_relative 'author'
require 'date'

class Item
  attr_reader :genre, :author, :label, :archived, :publish_date

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
    difference_year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_label(label_name, label_color)
    @label = Label.new(label_name, label_color)
  end

  def add_genre(genre)
    @genre = Genre.new(genre)
  end

  def add_author(first_name, last_name)
    @author = Author.new(first_name, last_name)
  end
end
