class Item
    attribute_accesor :genre, :author, :label
    attribute_reader :publish_date

    def initialize(publish_date)
        @id = 1...1000
        @publish_date = publish_date
        @archived = false
        @genre = nil
        @author = nil
        @label = nil
    end
    


end