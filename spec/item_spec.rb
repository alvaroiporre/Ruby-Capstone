require 'spec_helper'

RSpec.describe Item do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:item) { Item.new(publish_date) }

  describe '#initialize' do
    it 'sets the publish_date' do
      expect(item.publish_date).to eq(publish_date)
    end

    it 'sets archived to false' do
      expect(item.archived).to be(false)
    end

    it 'sets genre, author, and label to nil' do
      expect(item.genre).to be_nil
      expect(item.author).to be_nil
      expect(item.label).to be_nil
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if publish date is more than 10 years ago' do
      past_date = Date.today - (11 * 365)
      item = Item.new(past_date)
      expect(item.can_be_archived?).to be(true)
    end

    it 'returns false if publish date is within 10 years' do
      recent_date = Date.today - (9 * 365)
      item = Item.new(recent_date)
      expect(item.can_be_archived?).to be(false)
    end
  end

  describe '#move_to_archive' do
    it 'sets archived to true if can be archived' do
      allow(item).to receive(:can_be_archived?).and_return(true)
      item.move_to_archive
      expect(item.archived).to be(true)
    end

    it 'sets archived to false if cannot be archived' do
      allow(item).to receive(:can_be_archived?).and_return(false)
      item.move_to_archive
      expect(item.archived).to be(false)
    end
  end

  describe '#add_label' do
    it 'creates and adds a label to the item' do
      label_name = 'Label Name'
      label_color = 'Label Color'
      item.add_label(label_name, label_color)
      expect(item.label).to be_a(Label)
    end
  end
end
