# frozen_string_literal: true

Rails.application.routes.draw do
  concern :oai_provider, BlacklightOaiProvider::Routes.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :oai_provider
  end
end
