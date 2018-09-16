require ("minitest/autorun")
require ("minitest/rg")
require_relative("../karaoke_bar.rb")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../drink.rb")

class KaraokeBarTest < Minitest::Test

  def setup
    @room1 = Room.new("Room1", 10)
    @room2 = Room.new("Room2", 2)
    @room3 = Room.new("Room3", 5)

    @drink1 = Drink.new("Drink1", 3.50)
    @drink2 = Drink.new("Drink2",2)
    @drink3 = Drink.new("Drink3",3)
    @drinks = [@drink1, @drink2, @drink3]

    @karaoke_bar = KaraokeBar.new("Code Clan Caraoke", 100)
    @karaoke_bar.add_room(@room1)
    @karaoke_bar.add_room(@room2)
    @karaoke_bar.drinks = @drinks

    @guest1 = Guest.new("Guest1", 50)
    @guest2 = Guest.new("Guest2", 10)
    @guest3 = Guest.new("Guest3", 3)

  end

  def test_can_get_kareokebar_name
    assert_equal("Code Clan Caraoke", @karaoke_bar.name)
  end

  def test_can_get_kareokebar_rooms
    assert_equal([@room1, @room2], @karaoke_bar.rooms)
  end

  def test_get_number_of_rooms
    assert_equal(2, @karaoke_bar.get_number_of_rooms())
  end

  def test_add_rooms
    @karaoke_bar.add_room(@room2)
    assert_equal(3, @karaoke_bar.get_number_of_rooms())
  end

  def test_check_in_guest__room_has_capacity
    @karaoke_bar.check_in_guest(@room1, @guest1)
    assert_equal(1, @room1.get_number_of_guest())
  end

  def test_check_in_guest__no_capacity
    @karaoke_bar.check_in_guest(@room2, @guest1)
    @karaoke_bar.check_in_guest(@room2, @guest2)
    @karaoke_bar.check_in_guest(@room2, @guest3)  #should not allow this check_in
    assert_equal(2, @room2.get_number_of_guest())
  end

  def test_check_in_guest__has_enough_money
    @karaoke_bar.check_in_guest(@room1, @guest1)
    assert_equal(1, @room1.get_number_of_guest())
  end

  def test_check_in_guest__does_not_have_enough_money
    @karaoke_bar.check_in_guest(@room1, @guest3)
    assert_equal(0, @room1.get_number_of_guest())
  end

  def test_check_out_guest
    @karaoke_bar.check_in_guest(@room1, @guest1)

    @karaoke_bar.check_out_guest(@room1, @guest1)
    assert_equal(0, @room1.get_number_of_guest())
  end

  def test_add_song_to_room
    song = Song.new("Song1", "Artist1")
    @karaoke_bar.add_song_to_room(@room1, song)
    assert_equal(1, @room1.get_number_of_songs())
  end

  def test_remove_song_from_room
    song = Song.new("Song1", "Artist1")
    @karaoke_bar.add_song_to_room(@room1, song)
    @karaoke_bar.remove_song_from_room(@room1, song)
    assert_equal(0, @room1.get_number_of_songs())
  end

  def test_room_has_capacity
    assert_equal(true, @karaoke_bar.room_has_capacity(@room1))
  end

  def test_guest_has_enough_money__true
    assert_equal(true, @karaoke_bar.guest_has_enough_money(@guest1, @room1))
  end

  def test_guest_has_enough_money__false
    assert_equal(false, @karaoke_bar.guest_has_enough_money(@guest3, @room1))
  end

  def test_can_get_drinks
    assert_equal(@drinks, @karaoke_bar.drinks)
  end

  def test_can_get_till
    assert_equal(100, @karaoke_bar.till)
  end

  def test_sell_drink__customer_has_money
      @karaoke_bar.sell_drink(@guest1, @drink1)

      assert_equal(46.50, @guest1.wallet)
      assert_equal(103.50, @karaoke_bar.till)
      assert_equal(2, @karaoke_bar.drinks.length)
  end

  def test_sell_drink__customer_does_not_have_money
      @karaoke_bar.sell_drink(@guest3, @drink1)

      assert_equal(3, @guest3.wallet)
      assert_equal(100, @karaoke_bar.till)
      assert_equal(3, @karaoke_bar.drinks.length)
  end


end
