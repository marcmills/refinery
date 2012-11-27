module Refinery
  module CareHomes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CareHomes

      engine_name :refinery_care_homes

      initializer "register refinerycms_care_homes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "care_homes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.care_homes_admin_care_homes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/care_homes/care_home',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CareHomes)
      end
    end
  end
end
