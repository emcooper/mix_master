require "rails_helper"

RSpec.feature "User visits artist index" do
  before :each do
    @beyonce_image = "http://mp3teca.com/-/2014/11/Beyonce.jpg"
    @jayz_image = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Jay-Z_%40_Shawn_%27Jay-Z%27_Carter_Foundation_Carnival_%28crop_2%29.jpg/1200px-Jay-Z_%40_Shawn_%27Jay-Z%27_Carter_Foundation_Carnival_%28crop_2%29.jpg"
    Artist.create(name: "Beyonce", image_path: @beyonce_image)
    Artist.create(name: "Jay-Z", image_path: @jayz_image)
  end

  scenario "they see all artists" do
    visit '/artists'
    expect(page).to have_content("Beyonce")
    expect(page).to have_content("Jay-Z")
    expect(page).to have_css("img[src=\"#{@beyonce_image}\"]")
    expect(page).to have_css("img[src=\"#{@jayz_image}\"]")
  end
  scenario "the artist names link to individual pages" do
    visit '/artists'
    click_on "Beyonce"

    expect(page).to have_content("Beyonce")
    expect(page).to_not have_content("Jay-Z")
    expect(page).to have_css("img[src=\"#{@beyonce_image}\"]")
    expect(page).to_not have_css("img[src=\"#{@jayz_image}\"]")
  end
end
