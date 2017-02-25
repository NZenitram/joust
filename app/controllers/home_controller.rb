class HomeController < ApplicationController
  def index
    @solutions = CodeOfArmsService.get_response
  end
end
