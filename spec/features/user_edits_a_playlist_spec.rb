RSpec.feature "User edits a playlist name and songs" do
  scenario "they see the updated name and songs" do
    playlist = create(:playlist)
    song1 = create(:song)
    song2 = create(:song)
    playlist.songs << [song1, song2]
    song3 = create(:song)

    visit("/playlists/#{playlist.id}")
    click_on "Edit"
    fill_in "playlist_name", with: "Morning Jamz"
    check("song-#{song3.id}")
    uncheck("song-#{song1.id}")
    click_on "Update Playlist"
    save_and_open_page

    expect(page).to have_content "Morning Jamz"
    expect(page).to have_content song2.title
    expect(page).to have_content song3.title
    expect(page).to_not have_content song1.title
  end
end
