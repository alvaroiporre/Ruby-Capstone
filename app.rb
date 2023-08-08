class App
  attr_accessor :books, ,:games, :authors, :labels, :storage

  def initialize()
    @storage = Storage.new('storage')
    @books = []
    @games = []
    @authors = []
    @labels = []
    @functions = {
      1 => :list_all_books,
      2 => :list_all_games,
      5 => :list_all_labels,
      6 => :list_all_authors,
      9 => :add_item_game
    }
  end

  def list_all_books
    if @books.empty?
      puts 'There are not books created yet'
    else
      @books.each do |book|
        print "Title: '#{book.label.title}, Author: '#{book.author.first_name}'"
        puts ''
      end
    end
  end

  def list_all_games
    if @games.empty?
      puts 'There are not games created yet'
    else
      @games.each do |game|
        puts "Title: '#{game.label.title}, Author: '#{game.author.first_name}'\n"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are not labels created yet'
    else
      @labels.each do |label|
        print "Title: '#{label.title}, Color: '#{label.color}'"
        puts ''
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'There are not authors created yet'
    else
      @authors.each do |author|
        puts "'#{author.first_name}, '#{author.last_name}' \n"
      end
    end
  end

  def add_item_book()
    publisher = input_getter('Please enter the publisher: ')
    cover_state = input_getter('Describe the cover state of the book: ')
    publish_date = input_getter('published date (yyyy-mm-dd): ')
    @books << Book.new(Date.new(publish_date.to_i), publisher, cover_state)
    inputs(@books.last)
    puts ['Book created succesfully', '']
  end

  def add_item_game()
    multiplayer = input_getter('Please enter the multiplayer: ')
    last_played_at = input_getter('Please enter the date of the last played : ')
    publish_date = input_getter('published date (yyyy-mm-dd): ')
    @games << Game.new(Date.new(publish_date.to_i), multiplayer, Date.new(last_played_at.to_i))
    puts ['Game created succesfully', '']
  end
end
