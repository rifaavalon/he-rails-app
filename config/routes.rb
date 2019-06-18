Rails.application.routes.draw do
  get 'searches/companies:string'
  get 'searches/description:string'
  get 'searches/name:string'
  get 'searches/url:string'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
