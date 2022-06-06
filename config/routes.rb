Rails.application.routes.draw do

  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end
  concern :oai_provider, BlacklightOaiProvider::Routes.new

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
