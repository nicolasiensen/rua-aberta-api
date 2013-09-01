require "csv"
require 'open-uri'

namespace :path do
  task :import => :environment do |t, args|
    regex = /(\d+)[[\s-]|[\sAa]|[\sEe]]+(\d+)/
    CSV.parse(open("#{Rails.root}/lib/tasks/riorot.csv"), {headers: true}) do |row|
      if row[10] && row[10].match(regex)
        a, b = row[10].match(regex).captures
        point_a = Geocoder.search("#{row[2]} #{a}, Rio de Janeiro").first
        point_b = Geocoder.search("#{row[2]} #{b}, Rio de Janeiro").first
        puts point_a.inspect
        if point_a && point_b && point_a.city == "Rio de Janeiro" && point_b.city == "Rio de Janeiro"
          Path.create!(
            lat_a: point_a.latitude, 
            lng_a: point_a.longitude, 
            lat_b: point_b.latitude,
            lng_b: point_b.longitude,
            parking: true
          )
        end
      end
    end
  end
end
