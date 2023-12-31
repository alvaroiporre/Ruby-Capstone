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

  def retrieve_games(app)
    file = read('games.json')
    return if file.nil?

    file.each do |obj|
      multiplayer = obj['multiplayer']
      last_played_at = obj['last_played_at']
      publish_date = obj['publish_date']
      label = obj['label']
      author = obj['author']
      genre = obj['genre']
      game = Game.new(multiplayer, last_played_at, Date.new(publish_date.to_i))
      app.games << game
      game.add_genre(genre['name'])
      game.add_label(label['title'], label['color'])
      game.add_author(author['first_name'], author['last_name'])
      app.authors << game.author unless app.authors.include?(game.author)
      app.labels << game.label unless app.labels.include?(game.label)
      app.genres << game.genre unless app.genres.include?(game.genre)
    end
  end

  def retrieve_books(app)
    file = read('books.json')
    return if file.nil?

    file.each do |obj|
      publish_date = obj['publish_date']
      publisher = obj['publisher']
      cover_state = obj['cover_state']
      label = obj['label']
      author = obj['author']
      genre = obj['genre']
      book = Book.new(Date.new(publish_date.to_i), publisher, cover_state)
      app.books << book
      book.add_label(label['title'], label['color'])
      book.add_genre(genre['name'])
      book.add_author(author['first_name'], author['last_name'])
      app.authors << book.author unless app.authors.include?(book.author)
      app.labels << book.label unless app.labels.include?(book.label)
      app.genres << book.genre unless app.genres.include?(book.genre)
    end
  end

  def retrieve_authors(app)
    file = read('authors.json')
    return if file.nil?

    file.each do |obj|
      first_name = obj['first_name']
      last_name = obj['last_name']
      author = Author.new(first_name, last_name)
      app.authors << author
    end
  end

  def retrieve_labels(app)
    file = read('labels.json')
    return if file.nil?

    file.each do |obj|
      title = obj['title']
      color = obj['color']
      label = Label.new(title, color)
      app.labels << label
    end
  end

  def retrive_music_albums(app)
    file = read('music_albums.json')
    return if file.nil?

    file.each do |obj|
      label = obj['label']
      author = obj['author']
      genre = obj['genre']
      publish_date = obj['publish_date']
      on_spotify = obj['on_spotify']
      album = MusicAlbum.new(Date.new(publish_date.to_i), on_spotify)
      app.music_albums << album
      album.add_label(label['title'], label['color'])
      album.add_genre(genre['name'])
      album.add_author(author['first_name'], author['last_name'])
      app.authors << album.author unless app.authors.include?(album.author)
      app.labels << album.label unless app.labels.include?(album.label)
      app.genres << album.genre unless app.genres.include?(album.genre)
    end
  end

  def retrive_genres(app)
    file = read('genres.json')
    return if file.nil?

    file.each do |obj|
      name = obj['name']
      genre = Genre.new(name)
      app.genres << genre
    end
  end

  def retrieve_data(app)
    retrieve_books(app)
    retrieve_games(app)
    retrive_music_albums(app)
  end

  def create_file(array, name)
    array_hash = []
    array.each do |item|
      array_hash << item_to_json(item)
    end
    json = array_hash.to_json
    File.write(name.to_s, json)
  end

  def item_to_json(item)
    json_obj = {}
    item.instance_variables.each do |var|
      json_obj[var.to_s.gsub('@', '')] = if item.instance_variable_get(var).instance_variables.empty?
                                           item.instance_variable_get(var)
                                         else
                                           item_to_json(item.instance_variable_get(var))
                                         end
    end
    json_obj
  end
end
