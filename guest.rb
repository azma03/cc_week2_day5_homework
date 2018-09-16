class Guest

  attr_reader :name
  attr_accessor :wallet, :favourite_song

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @favourite_song = nil
  end

  def guest_cheer(room)
    if room.playlist.include?(@favourite_song)
      return "Whoo!"
    end
  end

end
