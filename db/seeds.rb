# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Animal.seed_animals

def get_description(animal_name)
  request = Typhoeus::Request.new(
    'http://api.gbif.org/v1/species',
    method: :get,
    params: {name: animal_name}
  )
  request.run
  JSON.parse(request.run.response_body)
end
