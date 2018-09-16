class KaraokeBar

  attr_reader :name, :rooms
  attr_accessor :drinks, :till

  def initialize(name, till)
    @name = name
    @till = till
    @rooms = []
    @drinks = []
  end

  def get_number_of_rooms
    return @rooms.length()
  end

  def add_room(room)
    @rooms.push(room)
  end

  def check_in_guest(room, guest)
    if (room_has_capacity(room) && guest_has_enough_money(guest, room))
      room.add_guest(guest)
    end
  end

  def check_out_guest(room, guest)
    room.remove_guest(guest)
  end

  def add_song_to_room(room, song)
    room.add_song(song)
  end

  def remove_song_from_room(room, song)
    room.remove_song(song)
  end

  def room_has_capacity(room)
    if room.get_number_of_guest() < room.capacity
      return true
    else
      return false
    end
  end

  def guest_has_enough_money(guest, room)
    if guest.wallet >= room.fee
      return true
    else
      return false
    end
  end

  def sell_drink(guest, drink)
    if guest.wallet >= drink.price
      @till += drink.price
      guest.wallet -= drink.price
      @drinks.delete(drink)
    end
  end
end
