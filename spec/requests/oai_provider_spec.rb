# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OaiProvider', type: :request do
  let!(:route_path) { '/catalog/oai' }
  let!(:expected_content_type) { 'text/xml; charset=utf-8' }

  describe 'verb=Identify' do
    let!(:params) { {verb: 'Identify'} }

    it 'expects a GET request to return a 200 xml response' do
      get route_path, params: params
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end

    it 'expects a POST request to return a 200 xml response' do
      post route_path, params: params
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end
  end

  describe 'verb=ListMetadataFormats' do
    let!(:params) { { verb: 'ListMetadataFormats'} }

    it 'expects a GET request to return a 200 xml response' do
      get route_path, params: params
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end

    it 'expects a POST request to return a 200 xml response' do
      post route_path, params: params
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end
  end

  describe 'verb=ListSets' do
    let!(:params) { { verb: 'ListSets'} }

    it 'expects a GET request to return a 200 xml response' do
      VCR.use_cassette('requests/list_sets') do
        get route_path, params: params
      end
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end

    it 'expects a POST request to return a 200 xml response' do
      VCR.use_cassette('requests/list_sets') do
        post route_path, params: params
      end
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end
  end

  describe 'verb=GetRecord' do
    let!(:identifier) { 'oai:dc3dev.bpl.org:bpl-dev:5712m712c' }
    let!(:params) { { verb: 'GetRecord', metadataPrefix: 'oai', identifier: identifier} }

    it 'expects a GET request to return a 200 xml response' do
      VCR.use_cassette('requests/get_record') do
        get route_path, params: params
      end
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end

    it 'expects a POST request to return a 200 xml response' do
      VCR.use_cassette('requests/get_record') do
        post route_path, params: params
      end
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end
  end

  describe 'verb=ListRecords' do
    let!(:params) { { verb: 'ListRecords', metadataPrefix: 'oai' } }

    it 'expects a GET request to return a 200 xml response' do
      VCR.use_cassette('requests/list_records') do
        get route_path, params: params
      end
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end

    it 'expects a POST request to return a 200 xml response' do
      VCR.use_cassette('requests/list_records') do
        post route_path, params: params
      end
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eql(expected_content_type)
    end

    context 'with set=set-identifier' do
      let!(:set_identifier) { 'bpl-dev:6w924c404a' }
      let!(:context_params) do
        ctx_params = params.dup
        ctx_params[:set] = set_identifier
        ctx_params
      end

      it 'expects a GET request to return a 200 xml response' do
        VCR.use_cassette('requests/list_records_with_set') do
          get route_path, params: context_params
        end
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eql(expected_content_type)
      end

      it 'expects a POST request to return a 200 xml response' do
        VCR.use_cassette('requests/list_records_with_set') do
          post route_path, params: context_params
        end
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eql(expected_content_type)
      end
    end
  end
end
