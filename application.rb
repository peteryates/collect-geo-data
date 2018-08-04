require 'sinatra'
require 'slim'
require 'exifr/jpeg'
require 'pry'

class Report
  attr_accessor :name, :phone, :description,
                :tipped_items_include, :photo,
                :raw_x, :raw_y

  def x
    @raw_x || coords_from_photo[:x]
  end

  def y
    @raw_x || coords_from_photo[:y]
  end

  private

  def coords_from_photo
    img = EXIFR::JPEG.new(File.join("public", @photo))
    { x: img.gps.latitude, y: img.gps.longitude }
  end

end

get '/' do
  slim :new
end

post '/reports' do


  params["report"].tap do |p|

    filename = p["photo"][:filename]
    file = p["photo"][:tempfile]

    # Dangerous, don't do this in a proper system!
    File.open(File.join(".", "public", "uploads", filename), "wb") do |f|
      f.write(file.read)
    end

    @report = Report.new.tap do |r|
      r.name = p["name"]
      r.phone = p["phone"]
      r.description = p["description"]
      r.tipped_items_include = p["tipped-items-include"]
      r.photo = File.join("uploads", filename)
      r.raw_x = p["x"] unless p["x"].empty?
      r.raw_y = p["y"] unless p["y"].empty?
    end

  end

  slim :show
end
