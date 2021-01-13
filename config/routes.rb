Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :backoffice do
    get '/', to: 'home#index'

    resources(:companies)
  end

  namespace :api do
    namespace :painel do
      namespace :v1 do
        resources :categories
      end
    end
  end

  defaults({format: :json}) do
    get('/:company_id', {to: "company#index", as: "company_front_web"})
  end
end
