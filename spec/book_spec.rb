require 'spec_helper'

describe Book do
  describe '#can_be_archived?' do
    context 'It check if a book is older than 10 years or if the cover is too damaged' do
      it 'Needs to be false due to the publish date' do
        @book = Book.new('2010-08-07', '', 'good')
        expect(@book.can_be_archived?).to eql(false)
      end
      it 'Needs to be true due to the cover_state' do
        @book = Book.new('2022-08-07', '', 'bad')
        expect(@book.can_be_archived?).to eql(true)
      end
      it 'Needs to be true beacuse it is new and the cover state is good' do
        @book = Book.new('2022-08-07', '', 'good')
        expect(@book.can_be_archived?).to eql(true)
      end
    end
  end
end
