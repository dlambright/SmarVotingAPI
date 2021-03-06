Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :issues
      resources :subscriptions
      resources :comments
      resources :voting_options
      resources :ballots
      resources :results
    end
  end
end
