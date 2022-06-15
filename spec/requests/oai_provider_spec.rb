# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OaiProvider', type: :request do
  let!(:route_path) { '/catalog/oai' }
  let!(:expected_content_type) { 'text/xml; charset=utf-8' }

  describe 'verb=Identify' do
    let!(:params) { { verb: 'Identify' } }

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
    let!(:params) { { verb: 'ListMetadataFormats' } }

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

    describe 'response body' do
      let(:xml) { xml_response(response.body) }
      let(:xpath) { '//xmlns:ListMetadataFormats/xmlns:metadataFormat/xmlns:metadataPrefix' }

      before(:each) do
        get route_path, params: params
      end

      it 'expects the response to contain only mods' do
        expect(xml.xpath(xpath).count).to be 1
        expect(xml_at_xpath(xml, xpath).text).to eql('mods')
      end
    end
  end

  describe 'verb=ListSets' do
    let!(:params) { { verb: 'ListSets' } }

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

      context 'with invalid set-identifier' do
        let(:invalid_params) do
          invalid = params.dup
          invalid[:set] = 'bpl-dev:foobar'
          invalid
        end

        let(:expected_error_code) { 'noRecordsMatch' }
        let(:xpath) { '//xmlns:error[@code]' }

        it 'expects the request error code to equal noRecordsMatch' do
          VCR.use_cassette('requests/list_records_with_invalid_set') do
            post route_path, params: invalid_params
          end
          expect(response.content_type).to eql(expected_content_type)
          xml = xml_response(response.body)
          expect(xml_at_xpath(xml, xpath).attribute('code').text).to eql(expected_error_code)
        end
      end
    end

    context 'with from=date' do
      let(:date_string) { '2022-01-01' }
      let!(:context_params) do
        ctx_params = params.dup
        ctx_params[:from] = date_string
        ctx_params
      end

      it 'expects a GET request to return a 200 xml response' do
        VCR.use_cassette('requests/list_records_with_from') do
          get route_path, params: context_params
        end
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eql(expected_content_type)
      end

      it 'expects a POST request to return a 200 xml response' do
        VCR.use_cassette('requests/list_records_with_from') do
          post route_path, params: context_params
        end
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eql(expected_content_type)
      end
    end

    context 'with until=date' do
      let(:date_string) { '2022-01-01' }
      let!(:context_params) do
        ctx_params = params.dup
        ctx_params[:from] = date_string
        ctx_params
      end

      it 'expects a GET request to return a 200 xml response' do
        VCR.use_cassette('requests/list_records_with_until') do
          get route_path, params: context_params
        end
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eql(expected_content_type)
      end

      it 'expects a POST request to return a 200 xml response' do
        VCR.use_cassette('requests/list_records_with_until') do
          post route_path, params: context_params
        end
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eql(expected_content_type)
      end
    end
  end
end
