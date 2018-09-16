require ("minitest/autorun")
require ("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class GuestTest < Minitest::Test
  def setup
    @guest = Guest.new("Guest1", 100)
  end

  def test_can_get_guest_name
    assert_equal("Guest1", @guest.name)
  end

  def test_can_get_guest_wallet
    assert_equal(100, @guest.wallet)
  end

  def test_can_update_wallet
    @guest.wallet = 102
    assert_equal(102, @guest.wallet)
  end

  def test_guest_cheer
    room = Room.new("Room1", 20)
    song = Song.new("Song1", "Artist1")
    room.add_song(song)

    @guest.favourite_song = song

    assert_equal("Whoo!", @guest.guest_cheer(room))
  end

end
