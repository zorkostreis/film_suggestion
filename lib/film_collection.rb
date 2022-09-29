require_relative "film"

class FilmCollection
  def self.from_xml(data)
    films =
      data.xpath("//tbody/tr").drop(1).map do |film|
        title, year, director = film.xpath("td")
                                    .map { |element| element.text.chomp }[1, 3]

        Film.new(title, director, year)
      end

    self.new(films)
  end

  def initialize(films)
    @films = films
  end

  def director_options
    @director_options = @films.map(&:director).uniq.sample(10)
    @director_options.map.with_index(1) { |director, index| "#{index}. #{director}" }
  end

  def select_films_by_director(director_index)
    @films.select { |film| film.director == @director_options[director_index - 1] }
  end
end
