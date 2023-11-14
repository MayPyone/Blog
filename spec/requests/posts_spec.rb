require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Elements for show' do
    it 'render the template of post index' do
      get '/users/1/posts'
      expect(response.body).to render_template('index')
      expect(response.body).to include('<h1>Posts#index</h1>')
      expect(response.body).to include('<p>user name</p>')
      expect(response.body).to include('<p>post1</p>')
      expect(response.body).to include('<p>post2</p>')
    end

    it 'render the show template for post' do
      get '/users/1/posts/shows'
      expect(response.body).to render_template('show')
      expect(response.body).to include('<h1>Posts#show</h1>')
      expect(response.body).to include('<p>post1</p>')
      expect(response.body).to include('<p>comment1</p>')
      expect(response.body).to include('<p>comment2</p>')
      expect(response.body).to include('<p>comment3</p>')
    end
  end
end
