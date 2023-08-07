class App
  attr_accessor :books, :labels, :storage

  def initialize()
    @storage = Storage.new('storage')
    @books = []
    @labels = []
    @functions = {
      1 => :list_all_books,
      5 => :list_all_labels
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
end