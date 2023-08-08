class App
  attr_accessor :books, :games, :genres, :music_albums, :authors, :labels, :storage

  def initialize()
    @storage = Storage.new('storage')
    @books = []
    @games = []
    @genres = []
    @music_albums = []
    @authors = []
    @labels = []
    @functions = {
      1 => :list_all_books,
      2 => :list_all_music_albums,
      3 => :list_all_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_item_book,
      8 => :add_music_album,
      9 => :add_item_game
    }
  end

  def trigger(int)
    send(@functions[int])
  end

  def input_getter(msj, is_number: false)
    print msj
    is_number ? gets.chomp.to_i : gets.chomp
  end

  def inputs(item)
    label = input_getter('Enter a label name: ')
    color = input_getter('Enter a label color: ')
    genre = input_getter('Enter a genre: ')
    first_name = input_getter('Author first_name: ')
    last_name = input_getter('Author last_name: ')
    item.add_author(first_name, last_name)
    item.add_genre(genre)
    item.add_label(label, color)
    @labels << item.label
    @authors << item.author
    @genres << item.genre
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

  def list_all_music_albums
    if @music_albums.empty?
      puts 'There are no music albums created yet'
    else
      @music_albums.each_with_index do |album, i|
        puts "- #{i + 1} Publish Date:#{album.publish_date} On Spotift: #{album.on_spotify}"
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

  def list_all_genres
    if @genres.empty?
      puts 'There are no genres created yet'
    else
      @genres.each_with_index do |genre, i|
        puts "- #{i + 1} Name: '#{genre.name}"
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

  def add_music_album
    publish_date = input_getter('enter the published date (yyyy-mm-dd): ')
    on_spotify = input_getter('Is it available on Spotify? [N/Y]')
    @music_albums << MusicAlbum.new(publish_date, on_spotify)
    inputs(@music_albums.last)
    puts "Music album created succesfully \n"
  end

  def add_item_game()
    multiplayer = input_getter('Please enter the multiplayer: ')
    last_played_at = input_getter('Please enter the date of the last played : ')
    publish_date = input_getter('published date (yyyy-mm-dd): ')
    @games << Game.new(Date.new(publish_date.to_i), multiplayer, Date.new(last_played_at.to_i))
    inputs(@games.last)
    puts ['Game created succesfully', '']
  end
end
