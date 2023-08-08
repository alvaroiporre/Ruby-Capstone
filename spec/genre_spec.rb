require_relative 'spec_helper'

describe Genre do
  context 'Creates a Genre class' do
    it 'Checks for name property' do
      genre = Genre.new('Pop')
      name = genre.name

      expect(name).to eq 'Pop'
    end
  end

  context 'Makes sure add items works' do
    before :each do
      @genre = Genre.new('Electro')
      @item = Item.new('2020-12-12')
    end

    it 'checks property publish date of new item' do
      @genre.add_item(@item)
      first_item = @genre.items[0].publish_date

      expect(first_item).to eq '2020-12-12'
    end

    it 'access the genre name from the item' do
      @genre.add_item(@item)
      genre = @item.genre.name

      expect(genre).to eq 'Electro'
    end
  end
end
