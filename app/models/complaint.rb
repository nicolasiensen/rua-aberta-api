class Complaint < ActiveRecord::Base
  attr_accessible :car_plate, :category, :lat, :lng, :note
  validates :car_plate, :category, :lat, :lng, presence: true

  after_create { self.delay.send_sms }

  private

  def send_sms
    geocoder = Geocoder.search("#{self.lat},#{self.lng}").first
    message_officer = "#{self.category} placa #{self.car_plate} na #{geocoder.street} #{geocoder.house_number}, #{geocoder.suburb}"[0..159]
    message_owner = "Seu carro placa #{self.car_plate} foi denunciado como '#{self.category}', o reboque foi acionado. Run Forest, run!"[0..159]
    puts message_officer
    puts message_owner
    #blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
    #blowerio['/messages'].post :to => '+552195744758', :message => message
  end
end
