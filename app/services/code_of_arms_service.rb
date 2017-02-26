module CodeOfArmsService

  def self.get_response
    response = Faraday.get('https://code-of-arms.herokuapp.com/api/v1/exercises')
    exercise_object = JSON.parse(response.body, symbolize_names: true)
    retrieve_exercise(exercise_object)
  end

  def self.retrieve_exercise(exercise_object)
    random_exercise = exercise_object.sample
    if random_exercise[:solutions].count < 2
      random_exercise = exercise_object.sample
    end
      parse_response(random_exercise)
  end

  def self.parse_response(response)
    solutions_object = response[:solutions]
  end

end
