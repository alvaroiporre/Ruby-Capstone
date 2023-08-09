require_relative 'spec_helper'

describe MusicAlbum do
  context 'Checks can_be_archived works by using move to archive' do
    it 'Old date returns true' do
      album = MusicAlbum.new('2003-10-10', true)
      album.move_to_archive

      expect(album.archived).to eq true
    end

    it 'close date & found in spotify returns false' do
      album = MusicAlbum.new('2023-10-10', true)
      album.move_to_archive

      expect(album.archived).to eq false
    end

    it 'old date but not found in spotify returns false' do
      album = MusicAlbum.new('2000-10-10', false)
      album.move_to_archive

      expect(album.archived).to eq false
    end
  end
end
