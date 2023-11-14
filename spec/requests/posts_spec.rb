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
    end

    it 'render the show template for post' do
      get '/users/1/posts/shows'
      expect(response.body).to render_template('show')
    end
  end
end
