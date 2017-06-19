require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do

  let(:request_url) { '/api/v1/authenticate' }

  # GET /api/v1/authenticate/:token_id
  describe 'GET /api/v1/authenticate/:token_id' do
    before { get request_url }


  end

end
