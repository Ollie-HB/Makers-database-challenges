1. Design and create the Table

Table: artists

Columns:
id | name | genre

2. Create Test SQL seeds

TRUNCATE TABLE artists RESTART IDENTITY;

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES ('Mobb Deep', 'Hip-Hop');

psql -h 127.0.0.1 music_library_test < seeds_artists.sql

3. Define the class names

# Table name: artists

# Model class
# (in lib/artist.rb)
class Artist
end

# Repository class
# (in lib/artist_repository.rb)
class ArtistRepository
end

4. Implement the Model class

class Artist
  attr_accessor :id, :name, :genre
end

5. Define the Repository Class interface

class ArtistRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    # Returns an array of Artist objects.
  end

6. Write Test Examples

# 1
# Get all artists

repo = ArtistRepository.new

artists = repo.all
artists.length # => 2
artists.first.id # => 1
artists.first.name # => 'Pixies'

it "returns the list of artists" do
        repo = ArtistRepository.new

        artists = repo.all

        expect(artists.length).to eq(2)
        expect(artists.first.id).to eq('1')
        expect(artists.first.name).to eq('Pixies')
    end
end

7. Reload the SQL seeds before each test run

def reset_artists_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end
  
        before(:each) do 
            reset_artists_table
    end

8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.