require 'date'

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
    
    def can_be_archived?
        now = Date.today
        before = Date.parse(publish_date.to_s)
        difference = (now - before).to_i
        difference_year = difference / 365
        difference_year < 10
    end
end