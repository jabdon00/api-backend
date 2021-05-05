Rails.application.routes.draw do
  mount Rw::Core::Engine => "/", as: 'rw'
end
