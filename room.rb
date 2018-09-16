class Room
  attr_reader :name, :capacity, :playlist
  attr_accessor :fee

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests = []
    @playlist = []
    @fee = 10
  end

  def get_guest_list()
    return @guests
  end

  def get_number_of_guest()
    return @guests.length
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def get_number_of_songs()
    return @playlist.length
  end

  def add_song(song)
    @playlist.push(song)
  end

  def remove_song(song)
    @playlist.delete(song)
  end

end
