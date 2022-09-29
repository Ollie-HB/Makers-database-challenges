1. Design and create the Table

Table: albums

Columns:
id | title | release_year | artist_id

2. Create Test SQL seeds

TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Surfer Rosa', 1988, 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Bossanova', 1990, 1);

psql -h 127.0.0.1 music_library_test < seeds_albums.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.


class Album
end

class AlbumRepository
end

4. Implement the Model class

class Album
  attr_accessor :id, :title, :release year, :artist_id
end

5. Define the Repository Class interface

class AlbumRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Album objects.
  end

   # Gets a single record by its ID
  # One argument: the id (number)

  def find(id)
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;

    # Returns a single Album object.
  end

6. Write Test Examples

# 1. Get all albums

repo = AlbumRepository.new

    it "returns the list of albums" do
    repo = AlbumRepository.new

    albums = repo.all

        albums = repo.all
        
        expect(albums.length).to eq 2
        expect(albums.first.id).to eq '1'
        expect(albums.first.title).to eq 'Surfer Rosa'
        expect(albums.first.release_year).to eq '1988'
        expect(albums.first.artist_id).to eq '1'
    end
end

# 2. Gets a single record by its ID

 it "returns one album with id of 1 - Surfer Rosa" do
      repo = AlbumRepository.new
        album = repo.find(1)
        
        expect(album.title).to eq 'Surfer Rosa'
        expect(album.release_year).to eq '1988'
        expect(album.artist_id).to eq '1'
    end

# 3. Gets a single record by its ID(2)

 it "returns one album with id of 2 - Bossanova" do
      repo = AlbumRepository.new
        album = repo.find(2)
  
          expect(album.title).to eq 'Bossanova'
          expect(album.release_year).to eq '1990'
          expect(album.artist_id).to eq '1'
  end

7. Reload the SQL seeds before each test run

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

  before(:each) do 
    reset_albums_table
  end

8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.