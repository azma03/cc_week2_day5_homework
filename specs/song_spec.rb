require ("minitest/autorun")
require ("minitest/rg")
require_relative("../song.rb")

class SongTest < Minitest::Test

  def setup
    @song = Song.new("Song1", "Artist1")
  end

  def test_can_get_song_name
    assert_equal("Song1", @song.title)
  end

  def test_can_get_song_artist
    assert_equal("Artist1", @song.artist)
  end

end
