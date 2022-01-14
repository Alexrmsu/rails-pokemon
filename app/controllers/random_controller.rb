# Use el @ para usar las variables en conjunto en el html, con el fin de que se puedan visualizar
# Intente hacer un hash para obtener mas de un tipo, pero no tuve exito, solo se muestra un tipo del pokemon

class RandomController < ApplicationController
  def index
    code = rand(1..99)
    url = "https://pokeapi.co/api/v2/pokemon-form/#{code}/"
    response = HTTParty.get url
    result = JSON.parse response.to_s
    @name = result['name']
    @id = code
    # Utilizo el id para buscar la habilidad del pokemon correspondiente
    url_skill = "https://pokeapi.co/api/v2/pokemon/#{@id}"
    response_skill = HTTParty.get url_skill
    result = JSON.parse response_skill.to_s
    @skill = result['abilities'][0]['ability']['name']
    @url_image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{@id}.png"
    @type = result['types'][0]['type']['name']
  end
end
