class App
  attr_accessor :books, :labels 

  def initialize()
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
  
end
