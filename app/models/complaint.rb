class Complaint < ActiveRecord::Base
  attr_accessible :car_plate, :category, :lat, :lng, :note
  validates :car_plate, :category, :lat, :lng, presence: true

  after_create { self.delay.send_sms }

  def self.send_sms
    #geocoder = Geocoder.search("#{self.lat},#{self.lng}").first
    message_officer = "Carro estacionado em local proibido placa KXO 1234 na Av. Sao Sebastiao 18, Urca"[0..159]
    message_owner = "Seu carro Peugeot 207 placa KXO 1234 esta estacionado em local proibido, o reboque foi acionado. Run Forest, run"[0..159]
    puts message_officer
    puts message_owner
    blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
    blowerio['/messages'].post :to => '+552195744758', :message => message_officer
    blowerio['/messages'].post :to => '+552199206052', :message => message_owner
  end
end
