RSpec.feature "User submits a new song" do
  scenario "they see page for individual song and link to artist page" do
    artist = create(:artist)
    song_title = "One Love"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
