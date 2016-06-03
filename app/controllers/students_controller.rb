class StudentsController < ApplicationController

  def show
    # @student = Student.find_by(id: params[:id])
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['SECRET_CONSUMER_KEY']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['SECRET_ACCESS_TOKEN']
    end
    @client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
      puts "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
