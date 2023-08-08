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
require './Main_methods'

puts 'Welcome to Catalog of my things!'

includde Main_methods

def read_files(app)
  @app.storage.retrieve_data(app)
end

def write_files
  @app.storage.create_file(@app.games, 'games.json')
  @app.storage.create_file(@app.authors, 'authors.json')
  @app.storage.create_file(@app.books, 'books.json')
  @app.storage.create_file(@app.labels, 'labels.json')
  @app.storage.create_file(@app.music_albums, 'music_albums.json')
end
