Rails.application.routes.draw do
  root 'home#index'
  post 'home/search_lines' => 'home#search_lines'
end
