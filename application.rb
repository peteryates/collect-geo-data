require 'sinatra'
require 'slim'
require 'pry'

class Report
  attr_accessor :name, :phone, :description,
                :tipped_items_include, :photo,
                :x, :y
end

get '/' do
  slim :new
end

post '/reports' do

  params["report"].tap do |p|
    @report = Report.new.tap do |r|
      r.name = p["name"]
      r.phone = p["phone"]
      r.description = p["description"]
      r.tipped_items_include = p["tipped-items-include"]
      r.photo = p["photo"]
      r.x = p["x"]
      r.y = p["y"]
    end

  end

  slim :show
end
