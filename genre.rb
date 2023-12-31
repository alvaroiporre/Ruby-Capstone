class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = rand(0..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(@name)
  end
end
