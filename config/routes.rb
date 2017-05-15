Rails.application.routes.draw do
  root 'home#index'

  get '/search_lines/:term', to: 'lines#search_lines'
  get '/load_line_details/:line_code', to: 'lines#load_line_details'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
