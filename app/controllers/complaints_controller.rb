class ComplaintsController < InheritedResources::Base
  respond_to :json

  def create
    Complaint.delay.send_sms
  end
end
