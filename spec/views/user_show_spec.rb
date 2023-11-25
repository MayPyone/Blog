require 'rails_helper'

RSpec.describe 'Users', type: :feature do
    before do
    @user1 = User.create!(id: 5, name: 'Bijay',photo: 'https://c0.klipartz.com/pngpicture/695/991/gratis-png-profesor.png') 
    @user2 = User.create!(id: 6, name: 'May', photo: 'https://c0.klipartz.com/pngpicture/695/991/gratis-png-profesor.png') 
    Post.create!(title: 'Intro', text: 'Hi', comment_counter: 0, like_counter: 2, author: @user1)
    Post.create!(title: 'Intro', text: 'Hi', comment_counter: 0, like_counter: 2, author: @user1)
    Post.create!(title: 'Intro', text: 'Hi', comment_counter: 0, like_counter: 2, author: @user2)
    
    end

  describe 'returns user index page' do

    it "returns specific user's name" do
      visit user_path(@user1)
      expect(page).to have_content("Bijay")
      visit user_path(@user2)
      expect(page).to have_content("May")
    end

    it "returns users' image link" do
      visit user_path(@user1)
      expect(page).to have_css("img[src*='#{@user1.photo}']")
      visit user_path(@user2)
      expect(page).to have_css("img[src*='#{@user2.photo}']")
    end

    it "return number of posts" do
       visit user_path(@user1)
     expect(@user1.posts.count).to have_content(2)
    visit user_path(@user2)
   expect(@user2.posts.count).to have_content(1)
    end

    it 'redirects to user show page' do
     visit user_path(@user1)
       save_and_open_page
       click_button("See all posts")
       sleep 15
      expect(current_path).to eq(user_posts_path(@user1)) 
  end
end
end
