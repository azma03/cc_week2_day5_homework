require ("minitest/autorun")
require ("minitest/rg")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class RoomTest < Minitest::Test
  def setup
    @room = Room.new("Room1", 20)
  end

  def test_can_get_room_name
    assert_equal("Room1", @room.name)
  end

  def test_can_get_room_capacity
    assert_equal(20 , @room.capacity)
  end

  def test_can_get_guest_list
    assert_equal([] , @room.get_guest_list())
  end

  def test_can_get_number_of_guests
    assert_equal(0, @room.get_number_of_guest())
  end

  def test_add_guest
    guest = Guest.new("Guest1", 10)
    @room.add_guest(guest)
    assert_equal(1,@room.get_number_of_guest())
  end

  def test_remove_guest
    guest1 = Guest.new("Guest1", 10)
    guest2 = Guest.new("Guest2", 10)
    @room.add_guest(guest1)
    @room.add_guest(guest2)

    @room.remove_guest(guest2)
    assert_equal(1,@room.get_number_of_guest())
  end

  def test_can_get_number_of_songs
    assert_equal(0, @room.get_number_of_songs())
  end

  def test_add_song
    song = Song.new("Song1", "Artist1")
    @room.add_song(song)
    assert_equal(1,@room.get_number_of_songs())
  end

  def test_remove_song
    song1 = Song.new("Song1", "Artist1")
    song2 = Song.new("Song2", "Artist2")
    @room.add_song(song1)
    @room.add_song(song2)

    @room.remove_song(song2)
    assert_equal(1,@room.get_number_of_songs())
  end

  def test_can_update_fee
    @room.fee = 15
    assert_equal(15, @room.fee)
  end


end
