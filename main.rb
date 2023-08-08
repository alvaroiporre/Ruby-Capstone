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
