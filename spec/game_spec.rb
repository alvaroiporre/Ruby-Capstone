require 'spec_helper'

describe Game do
  describe '#can_be_archived?' do
    context 'It check if a book is older than 2 years ' do
      it 'Needs to be true due to the publish date' do
        @game = Game.new('2018-08-07', 'multiplayer', '2023-08-07')
        expect(@game.can_be_archived?).to eql(false)
      end
      it 'Needs to be false due to the cover_state' do
        @game = Game.new('2022-08-07', 'multiplayer', '2023-08-07')
        expect(@game.can_be_archived?).to eql(false)
      end
    end
  end
end
