Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sales, only: [:new, :create]
  get 'sales/done'
  root "sales#new"
  # cree las rutas de los métodos new y create que son (por defecto resources los crea en REST):
  # sales POST /sales(.:format) sales#create
  # new_sale GET /sales/new(.:format) sales#new
end
