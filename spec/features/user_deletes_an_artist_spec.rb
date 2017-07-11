RSpec.feature "User deletes an artist" do
  scenario "they return to index page and artist is not there" do
    @beyonce_image = "http://mp3teca.com/-/2014/11/Beyonce.jpg"
    Artist.create(name: "Beyonce", image_path: @beyonce_image)
    artist = Artist.last

    visit "/artists/#{artist.id}"
    click_on "Delete"

    expect(current_path).to eq('/artists')
    expect(page).to_not have_content("Beyonce")
  end
end
