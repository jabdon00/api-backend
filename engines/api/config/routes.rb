# frozen_string_literal: true

Rw::Core::Engine.routes.draw do
  scope module: 'api', defaults: { format: :json } do
    namespace :api do
      namespace :v1 do
        devise_for :users, class_name: 'Rw::User', module: :devise,
                           path: '',
                           path_names: {
                             sign_in: 'login',
                             sign_out: 'logout',
                             registration: 'signup'
                           },
                           controllers: {
                             sessions: 'rw/api/sessions',
                             registrations: 'rw/api/registrations'
                           }
      end
    end
  end
end
