require './game'
require './author'
require './app'
require './item'
require './music_album'
require './genre'
require 'date'
require './book'
require './label'
require './storage'
require 'json'

puts 'Welcome to Catalog of my things!'

def read_files(app)
  @app.storage.retrieve_data(app)
end

def write_files
  @app.storage.create_file(@app.games, 'games.json')
  @app.storage.create_file(@app.authors, 'authors.json')
  @app.storage.create_file(@app.books, 'books.json')
  @app.storage.create_file(@app.labels, 'labels.json')
  @app.storage.create_file(@app.music_albums, 'music_albums.json')
  @app.storage.create_file(@app.genres, 'genres.json')
end

def main
  if @app.nil?
    @app = App.new
    read_files(@app)
  end
  @app.options
  option = gets.chomp.to_i
  valid_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  if valid_options.include?(option)
    if option == 10
      write_files
      puts 'Thanks for using this app'
    else
      @app.trigger(option)
      main
    end
  else
    puts ['Error, choose one of the options', '']
    main
  end
end

main
