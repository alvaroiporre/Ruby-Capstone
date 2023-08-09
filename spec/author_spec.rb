require 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('William', 'Shakespreare')
    @mock_item = Item.new('2023-08-20')
  end

  describe '#add_item' do
    context 'This is a method from Author class to atatch an item to items array' do
      it 'Add an item to items array expect items.legnth plus one (from 0 to 1)' do
        @author.add_item(@mock_item)
        expect(@author.instance_variable_get(:@items).length).to eq(1)
      end
      it 'Add an item to add an instances of Author in @mock_item[@author]' do
        @author.add_item(@mock_item)
        expect(@mock_item.author).to be_an_instance_of(Author)
      end
    end
  end
end
