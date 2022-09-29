require_relative '../lib/album_repository.rb'

RSpec.describe AlbumRepository do

    def reset_albums_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
      end
      
        before(:each) do 
          reset_albums_table
    end

    it "returns the list of albums" do
      repo = AlbumRepository.new

      albums = repo.all
        
        expect(albums.length).to eq 2
        expect(albums.first.id).to eq '1'
        expect(albums.first.title).to eq 'Surfer Rosa'
        expect(albums.first.release_year).to eq '1988'
        expect(albums.first.artist_id).to eq '1'
    end

    it "returns one album with id of 1 - Surfer Rosa" do
      repo = AlbumRepository.new
        album = repo.find(1)

        expect(album.title).to eq 'Surfer Rosa'
        expect(album.release_year).to eq '1988'
        expect(album.artist_id).to eq '1'
    end

    it "returns one album with id of 2 - Bossanova" do
      repo = AlbumRepository.new
        album = repo.find(2)
  
          expect(album.title).to eq 'Bossanova'
          expect(album.release_year).to eq '1990'
          expect(album.artist_id).to eq '1'
      end
end




