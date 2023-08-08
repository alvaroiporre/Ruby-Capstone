require_relative 'item'

class Author
  attr_reader :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(0..1000)
    @items = []
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end
end
