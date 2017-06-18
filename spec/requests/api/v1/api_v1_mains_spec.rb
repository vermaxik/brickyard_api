require 'rails_helper'

RSpec.describe "Api::V1::Mains", type: :request do

  let!(:mains) { create_list(:main, 5) }
  let(:main_id) { mains.first.id }
  let(:request_url) { '/api/v1/mains' }

  # GET /api/v1/mains
  describe 'GET /api/v1/mains' do
    before { get request_url }

    it 'returns states' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to be_success
    end

    it 'json contains needed keys' do
      expect(json[0].keys).to eq(["id", "state", "position"])
    end
  end

  # POST /api/v1/mains
  describe 'POST /api/v1/mains' do
    let(:valid_attributes) { {main: {state: 'new', position: 6}} }

    context 'when the request is valid' do
      before { post request_url, params: valid_attributes }

      it 'creates a state' do
        expect(json['state']).to eq('new')
        expect(json['position']).to eq(6)
      end

      it 'returns status code 201' do
        expect(response).to be_created
      end
    end

    context 'when the request is invalid' do
      before { post request_url, params: { position: 1 } }

      it 'returns status code 422' do
        expect(response).to be_unprocessable
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/State can't be blank/)
      end
    end
  end

  # PUT /api/v1/mains/:id
  describe 'PUT /api/v1/mains/:id' do
    let(:valid_attributes) { {main: {state: 'new', position: 1}} }

    context 'when the record exists' do
      before { put "#{request_url}/#{main_id}", params: valid_attributes }

      it 'updates the record' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(main_id)
        expect(json['state']).to eq('new')
        expect(json['position']).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to be_success
      end
    end

    context 'when the record doesnt exists' do
      before { put "#{request_url}/11111", params: valid_attributes }

      it 'returns status code 404' do
        expect(response).to be_not_found
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Couldn't find Main with/)
      end
    end
  end

  # DELETE /api/v1/mains/:id
  describe 'DELETE /api/v1/mains/:id' do
    before { delete "#{request_url}/#{main_id}" }

    it 'returns status code 204' do
      expect(response).to be_no_content
    end
  end

end
