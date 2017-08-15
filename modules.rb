#modules is a group of method to 'minxin' in a class
module AcceptsComments
  def comments
    #conditional assignment: if var is false, assign a value, otherwise stay intact
    #it is a shortcut for the expression: @var = @var || [] 
    #...which in its turn is a simplification of 'if-else' condition
    @comments ||= []
  end
  def add_comment(comment)
    comments << comment
  end 
end

class Clip 
  def play
    puts "Playing #{object_id}"
  end
end

class Video < Clip
  include AcceptsComments
  attr_accessor :resolution
end

class Song < Clip
  include AcceptsComments
  attr_accessor :beats_per_second
end

class Photo
  include AcceptsComments
  def initialize
    @format = 'JPEG'
  end
end

video = Video.new
video.add_comment("Nice visual effects")
video.add_comment("Weird ending")

song = Song.new
song.add_comment("Awesome beats")

photo = Photo.new
photo.add_comment("beautiful")

p video.comments, song.comments, photo.comments
