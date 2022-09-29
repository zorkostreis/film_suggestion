require "rspec"
require_relative "../lib/film"

describe "Film" do
  let(:film) { Film.new("Французский вестник", "Уэс Андерсон", 2021) }

  it "assigns instance variables" do
    expect(film.title).to eq "Французский вестник"
    expect(film.director).to eq "Уэс Андерсон"
    expect(film.year).to eq 2021
  end

  describe "#to_s" do
    it "returns correctly formatted string" do
      expect(film.to_s).to eq "Уэс Андерсон - Французский вестник (2021)"
    end
  end

end
