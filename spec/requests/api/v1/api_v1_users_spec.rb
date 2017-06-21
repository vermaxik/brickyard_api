require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do

  let!(:user) { create(:user, :with_position) }
  let!(:main) { create(:main, position: 2) }
  let(:request_url) { '/api/v1/state' }

  # PUT /api/v1/state
  describe 'PUT /api/v1/state' do
    let(:valid_attributes) { {token_id: user.token, main_id: main.id} }

    context 'when the request is valid' do
      before { put request_url, params: valid_attributes }

      it 'return a user with new status' do
        expect(json).not_to be_empty
        expect(json['main']['id']).to eq(main.id)
        expect(json['main']['state']).to eq(main.state)
      end

      it 'returns status code 200' do
        expect(response).to be_success
      end
    end

    context 'when the request is NOT valid' do
      let!(:main_wrong) { create(:main, position: 3) }
      before { put request_url, params: {token_id: user.token, main_id: main_wrong.id} }

      it 'return a user with new status' do
        expect(json).not_to be_empty
        expect(json['message']).to eq('Sorry, your state not accessible. Follow the order of state.')
      end

      it 'returns status code 422' do
        expect(response).to be_unprocessable
      end
    end
  end

end
