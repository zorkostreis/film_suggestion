require_relative "lib/film_collection"
require "nokogiri"
require "open-uri"

url = "https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb"

data = Nokogiri::HTML(URI.open(url))

film_collection = FilmCollection.from_xml(data)

puts "Давайте выберем фильм на вечер"
puts "Фильм какого режиссёра вы хотите посмотреть?"

puts film_collection.director_options

print "Введите число: "
user_input = $stdin.gets.to_i

puts "Cегодня вечером рекомендуем посмотреть:"
puts film_collection.select_films_by_director(user_input).sample
