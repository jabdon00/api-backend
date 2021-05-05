Rw::Core::Engine.routes.draw do
  scope module: 'api', defaults: { format: :json } do
    namespace :v1 do

    end
  end
end
