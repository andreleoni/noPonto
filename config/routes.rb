Rails.application.routes.draw do
  root 'home#index'

  get '/search_lines/:term', to: 'line#search_lines'
  get '/load_line_details/:line_code', to: 'line#load_line_details'
  get '/stop_search/:term', to: 'stop#stop_search'
  get '/stop_search_by_line/:line_code', to: 'stop#stop_search_by_line'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
