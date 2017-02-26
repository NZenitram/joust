class HomeController < ApplicationController

  def index
    @solutions = CodeOfArmsService.get_response.take(2)
  end

  def create
    binding.pry
  end
end
