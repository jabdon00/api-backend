module Rw
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Rw
      
      config.autoload_paths << File.expand_path('../app/forms', __FILE__)

      initializer :append_migrations do |app|
        unless app.root.to_s.match(root.to_s)
          config.paths["db/migrate"].expanded.each do |p|
            app.config.paths["db/migrate"] << p
          end
        end
      end

      I18n.enforce_available_locales = false
      I18n.available_locales = [ :fa ]
      I18n.default_locale = :fa
      
    end
  end
end