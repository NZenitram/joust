class HomeController < ApplicationController

  def index
    @solutions = CodeOfArmsService.get_response.take(2)

  end
end
