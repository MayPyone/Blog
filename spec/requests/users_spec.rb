require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'View for users' do
    it 'show all the included elements from the index page and render the template' do
      get '/users'
      expect(response.body).to include('<h1>Users#index</h1>')
      expect(response.body).to include('<p>user name </p>')
      expect(response.body).to include('<p>number of post </p>')
      expect(response.body).to render_template('index')
    end

    it 'render the show page' do
      get '/users/shows'
      expect(response.body).to render_template('show')
      expect(response.body).to include('<h1>Users#show</h1>')
      expect(response.body).to include('<p>user name</p>')
      expect(response.body).to include('<p>bio</p>')
      expect(response.body).to include('<p>post1</p>')
    end

    it 'mock one element' do
      user = User.create!(id: 1, name: 'may')
      get '/users'
      assert_includes response.body, user.id.to_s
    end
  end
end
