Rails.application.routes.draw do
  concern :oai_provider, BlacklightOaiProvider::Routes.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :oai_provider
  end
end
