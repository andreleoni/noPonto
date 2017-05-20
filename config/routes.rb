Rails.application.routes.draw do
  root 'home#index'

  post 'home/search_lines' => 'home#search_lines'
  get '/search_lines/:term', to: 'line#search_lines'
  get '/load_line_details/:line_code', to: 'line#load_line_details'
  get '/vehicles_position/:line_code', to: 'line#vehicles_position'
  get '/map_route/', to: 'line#map_route'
  get '/stop_search/:term', to: 'stop#stop_search'
  get '/stop_search_by_line/:line_code', to: 'stop#stop_search_by_line'
end
