Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sceneries' => 'sceneries#index'
  post 'sceneries' => 'sceneries#create'
  patch 'sceneries/:id' => 'sceneries#update'
  delete 'sceneries/:id' => 'sceneries#delete'
end
