class Animal < ActiveRecord::Base

  def get_description
    request = Typhoeus::Request.new(
      'http://api.gbif.org/v1/species',
      method: :get,
      params: { name: name }
    )
    request.run
    JSON.parse(request.run.response_body)
  end

  def self.seed_animals
    response = WildlifeApiRequest.new(:animal_classes).response
    animal_classes = JSON.parse(response.response_body)
    animal_classes['Class'].each do |animal_class|
      get_families(animal_class['ClassName'] )
    end
  end

  def self.get_families(animal_class)
    request = WildlifeApiRequest.new(:animal_families)
    request.animal_class = animal_class
    response = JSON.parse(request.response.response_body)
    response['Family'].each do |family|
      seed_animal(family)
    end
  end

  def self.seed_animal(family)
    request = WildlifeApiRequest.new
    request.root = family['SpeciesUrl']
    response = JSON.parse(request.response.response_body)
    if response['Species']
      puts response['Species']
      response['Species'][0]['AcceptedCommonName']
      name = response['Species'][0]['AcceptedCommonName']
      taxon_id = response['Species'][0]['TaxonID']
      Animal.find_or_create_by(name: name, taxon_id: taxon_id) if name
    end
  end

end
