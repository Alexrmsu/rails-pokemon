# use el @ para usar las variables en conjunto en el html, con el fin de que se puedan visualizar

class RandomController < ApplicationController
  def index
    code = rand(0..100)
    url = "https://pokeapi.co/api/v2/pokemon-form/#{code}/"
    # url parse
    response = HTTParty.get url
    result = JSON.parse response.to_s
    # defino la variable nombre gracias a la variable result (el parse)
    @name = result['name']
    @id = code
    # utilizo el id para buscar la habilidad del pokemon correspondiente
    url_skill = "https://pokeapi.co/api/v2/pokemon/#{@id}"
    response_skill = HTTParty.get url_skill
    result = JSON.parse response_skill.to_s
    @skill = result['abilities'][0]['ability']['name']
    @url_image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{@id}.png"
    @type = result['types'][0]['type']['name']
  end
end
