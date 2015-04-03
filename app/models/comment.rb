class Comment < ActiveRecord::Base
	belongs_to :post
	validates :name, :presence => true
	validates :content, :presence => true
	after_create :send_message

private

  def send_message
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => "Your Post Was Commented On! Go to your blog to check it out ",
                      :To => ENV['MY_VERIFIED_NUMBER'],
                      :From => ENV['MY_TWILIO_NUMBER'] }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end