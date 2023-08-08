require_relative 'author'
require_relative 'game'
require 'json'

class Storage
  def initialize(relative_path)
    @relative_path = relative_path
  end

  def read(file_name)
    return unless File.exist?(file_name.to_s)

    file = File.read(file_name.to_s)
    file == '' ? [] : JSON.parse(file)
  end

  def retrieve_books(app)
    file = read('./storage/books.json')
    return if file.nil?

    file.each do |obj|
      publish_date = obj['publish_date']
      publisher = obj['publisher']
      cover_state = obj['cover_state']
      label = obj['label']
      author = obj['author']
      book = Book.new(Date.new(publish_date.to_i), publisher, cover_state)
      app.books << book
      book.add_label(label['title'], label['color'])
      book.add_author(author['first_name'], author['last_name'])
      app.authors << book.author unless app.authors.include?(book.author)
      app.labels << book.label unless app.labels.include?(book.label)
    end
  end

  def retrieve_labels(app)
    file = read('./storage/labels.json')
    return if file.nil?

    file.each do |obj|
      title = obj['title']
      color = obj['color']
      label = Label.new(title, color)
      app.labels << label
    end
  end

  def retrive_music_albums(app)
    file = read('./storage/music_albums.json')
    return if file.nil?

    file.each do |obj|
      publish_date = obj['publish_date']
      on_spotify = obj['on_spotify']
      album = MusicAlbum.new(Date.new(publish_date), on_spotify)
      app.music_albums << album
    end
  end

  def retrive_genres(app)
    file = read('./storage/genres.json')
    return if file.nil?

    file.each do |obj|
      name = obj['name']
      genre = Genre.new(name)
      app.genres << genre
    end
  end

  def retrieve_authors(app)
    file = read('./storage/authors.json')
    return if file.nil?

    file.each do |obj|
      first_name = obj['first_name']
      last_name = obj['last_name']
      author = Label.new(first_name, last_name)
      app.authors << author
    end
  end

  def retrieve_games(app)
    file = read('./storage/games.json')
    return if file.nil?

    file.each do |obj|
      publish_date = obj['publish_date']
      multiplayer = obj['multiplayer']
      last_played_at = obj['last_played_at']
      label = obj['label']
      author = obj['author']
      game = Game.new(Date.new(publish_date.to_i), multiplayer, last_played_at)
      app.games << game
      game.add_label(label['title'], label['color'])
      game.add_author(author['first_name'], author['last_name'])
      app.authors << book.author unless app.authors.include?(book.author)
      app.labels << book.label unless app.labels.include?(book.label)
    end
  end

  def retrieve_data(app)
    retrieve_books(app)
    retrieve_games(app)
    retrive_genres(app)
    retrive_music_albums(app)
  end

  def create_file(array, name)
    array_hash = []
    array.each do |item|
      array_hash << item_to_json(item)
    end
    json = array_hash.to_json
    File.write("./#{@relative_path}/#{name}", json)
  end
end
