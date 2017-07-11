require "rails_helper"

RSpec.feature "User edits an artist name" do
  scenario "they see the updated name and original image" do
    @beyonce_image = "http://mp3teca.com/-/2014/11/Beyonce.jpg"
    Artist.create(name: "Beyonce", image_path: @beyonce_image)
    artist = Artist.last

    visit "/artists/#{artist.id}"
    click_on "Edit"
    fill_in "artist_name", with: "Solange"
    click_on "Update Artist"

    expect(page).to have_content("Solange")
    expect(page).to_not have_content("Beyonce")
  end
end
