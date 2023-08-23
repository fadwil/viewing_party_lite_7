require "rails_helper"

RSpec.describe "user discover page" do
  before :each do
    @user1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user3 = User.create!(name: "Tom", email: "tom@yahoo.com", id: 3)
  end
  describe "discover page", :vcr do
    it "has a link to find top rated movies" do
      visit "/users/#{@user1.id}/discover"

      expect(page).to have_content("Discover Movies")
      expect(page).to have_button("Find Top Rated Movies")

      click_button "Find Top Rated Movies"

      expect(current_path).to eq(user_movies_path(@user1))
    end

    it "has a link to search for movies" do
      visit "/users/#{@user1.id}/discover"

      expect(page).to have_button("Find Movies")

      fill_in "search", with: "Fight Club"

      click_button "Find Movies"

      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content("Fight Club")
    end
  end
end