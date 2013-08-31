require "CSV"

namespace :path do
  task :import, [:url] => :environment do |t, args|
    regex = /(\d+)[[\s-]|[\sAa]|[\sEe]]+(\d+)/
    CSV.parse(open(args[:url]), {headers: true}) do |row|
      puts row
      if row[10] && row[10].match(regex)
        a, b = row[10].match(regex).captures
        point_a = Geocoder.search("#{row[2]} #{a}").first
        point_b = Geocoder.search("#{row[2]} #{b}").first
        if point_a && point_b && point_a.city == "Rio de Janeiro" && point_b.city == "Rio de Janeiro"
          Path.create!(
            lat_a: point_a.coordinates[0], 
            lng_a: point_a.coordinates[1], 
            lat_b: point_b.coordinates[0],
            lng_b: point_b.coordinates[1],
            parking: true
          )
        end
      end
    end
  end
end
