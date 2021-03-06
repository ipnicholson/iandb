require 'rails_helper'

describe "Destroying a movie" do
  it "destroys the movie and redirects to movies listing page without the deleted movie; shows flash messaging" do
    movie = Movie.create(movie_attributes)

    visit movie_path(movie)

    expect(current_path).to eq(movie_path(movie))

    click_link "Delete"

    expect(current_path).to eq(movies_path)
    expect(page).not_to have_text(movie.title)

    expect(page).to have_text("Movie successfully deleted!")
  end
end