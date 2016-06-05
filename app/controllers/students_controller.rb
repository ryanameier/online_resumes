class StudentsController < ApplicationController

  def show
@student = Unirest.get("https://resume-data.herokuapp.com/api/v1/students/#{params[:id]}.json").body
  end
end
