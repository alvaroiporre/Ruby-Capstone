require 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('Nelson', 'Araujo')
    @mock_item = Item.new('2020-05-10')
  end

  describe '#add_item' do
    context 'This is a method from Label class to atatch an item to items array' do
      it 'Add an item to items array expect items.legnth plus one (from 0 to 1)' do
        @label.add_item(@mock_item)
        expect(@label.instance_variable_get(:@items).length).to eq(1)
      end
      it 'Add an author to add an instances of Label in @mock_item[@label]' do
        @label.add_item(@mock_item)
        expect(@mock_item.label).to be_an_instance_of(Label)
      end
    end
  end
end
