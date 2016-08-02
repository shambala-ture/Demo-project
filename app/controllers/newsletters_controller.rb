class NewslettersController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    
    if params[:newsletter][:email].present?
      gb = Gibbon::API.new
      begin
        gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email => {:email => params[:newsletter][:email]}, :double_optin => false})
        @message = "Successfully subscribed"
      rescue Gibbon::MailChimpError => e
        @message= e.message
        # puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
      end
      # render json: {message: 'Successfully subscribed'}
    else
      # render json: {message: 'Please Provide Email ID'}
    end  

  end

 
end
