module CodeOfArmsService

  def self.get_solution_pairs(all_solutions, current_user)
    if Comment.where(user_id: current_user.id).last.winner.nil?
      all_solutions.take(2)
    else
      most_recent_winner = Comment.where(user_id: current_user.id).last.winner
    end
  end

  def self.get_response
    response = Faraday.get('https://code-of-arms.herokuapp.com/api/v1/exercises')
    exercise_object = JSON.parse(response.body, symbolize_names: true)
    retrieve_exercise(exercise_object)
  end

  def self.retrieve_exercise(exercise_object)
    random_exercise = exercise_object.sample
    if random_exercise[:solutions].count >= 2
      parse_response(random_exercise)
    else
      retrieve_exercise(exercise_object)
    end
  end

  def self.parse_response(response)
    solutions_object = response[:solutions]
  end

end
