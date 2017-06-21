require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do

  let!(:user) { create(:user) }
  let(:request_url) { '/api/v1/authenticate' }

  # POST /api/v1/authenticate
  describe 'POST /api/v1/authenticate' do
    let(:valid_attributes) { {login: user.login, password: user.password} }

    context 'when the request is valid' do
      before { post request_url, params: valid_attributes }

      it 'return a user' do
        expect(json).not_to be_empty
        expect(json['login']).to eq(user.login)
      end

      it 'returns status code 200' do
        expect(response).to be_success
      end
    end

    context 'when the request is NOT valid' do
      before { post request_url, params: {login: 'not_valid', password: 'pass'}  }

      it 'return a user' do
        expect(json).not_to be_empty
        expect(json['message']).to eq('Please check credentials.')
      end

      it 'returns status code 422' do
        expect(response).to be_unprocessable
      end
    end
  end

  # GET /api/v1/authenticate/:token_id
  describe 'GET /api/v1/authenticate/:token_id' do
    let(:valid_attributes) { {login: user.login, password: user.password} }

    context 'when the request is valid' do
      before { get "#{request_url}/#{user.token}"}

      it 'return a user' do
        expect(json).not_to be_empty
        expect(json['login']).to eq(user.login)
      end

      it 'return a user with a  state' do
        expect(json['main']).not_to be_empty
        expect(json['main']['id']).to eq(user.main_id)
      end

      it 'returns status code 200' do
        expect(response).to be_success
      end
    end
  end


end
