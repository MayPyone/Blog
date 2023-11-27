require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @user1 = User.create!(id: 5, name: 'Bijay',
                          photo: 'https://c0.klipartz.com/pngpicture/695/991/gratis-png-profesor.png')
    @user2 = User.create!(id: 6, name: 'May',
                          photo: 'https://c0.klipartz.com/pngpicture/695/991/gratis-png-profesor.png')
    @post1 = Post.create!(title: 'Intro', text: 'Hi', comment_counter: 0, like_counter: 2, author: @user1)
    Post.create!(title: 'Intro', text: 'Hi', comment_counter: 0, like_counter: 2, author: @user1)
    Post.create!(title: 'Intro', text: 'Hi', comment_counter: 0, like_counter: 2, author: @user2)
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user1.id}/posts"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Elements for show' do
    it 'render the template of post index' do
      get "/users/#{@user1.id}/posts"
      expect(response.body).to render_template('index')
      expect(response.body).to include('Number of posts:')
    end

    it 'render the show template for post' do
      get "/users/#{@user1.id}/posts/#{@post1.id}"
      expect(response.body).to render_template('show')
      expect(response.body).to include('Hi')
    end
  end
end
