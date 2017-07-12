RSpec.feature "User visits playlist index" do
   before :all do
     @playlist = create(:playlist)
   end

  scenario "they see all playlist names" do
    visit("/playlists")

    expect(page).to have_content("#{@playlist.name}")
  end

  scenario "playlist names are links to individual pages" do
    visit("/playlists")

    expect(page).to have_link("#{@playlist.name}", :href => "/playlists/#{@playlist.id}")
  end
end
