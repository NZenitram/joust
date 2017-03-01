class HomeController < ApplicationController

  def index
    all_solutions = CodeOfArmsService.get_response
    @solutions = CodeOfArmsService.get_solution_pairs(all_solutions, current_user)
  end

  def create

  end
end
