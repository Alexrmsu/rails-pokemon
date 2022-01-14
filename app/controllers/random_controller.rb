class RandomController < ApplicationController
  def index
    url = "https://pokeapi.co/api/v2/pokemon/"
    response = HTTParty.get url
    result = JSON.parse response.to_s
    code = rand(0..19)
    @name = result['results'][code]['name']
    @id = code + 1
    url_skill = "https://pokeapi.co/api/v2/pokemon/#{@id}"
    response_skill = HTTParty.get url_skill
    result = JSON.parse response_skill.to_s
    @skill = result['abilities'][0]['ability']['name']
    @url_image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{@id}.png"
  end
end
