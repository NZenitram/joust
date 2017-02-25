module CodeOfArmsService

  def self.parse_response(response)
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    solutions_object = parsed_response[:solutions]
  end

end
