Rails.application.routes.draw do
  root to:'users#index'
  resources :users do
    collection {post :import}
    get :export_csv, on: :collection
  end
end
