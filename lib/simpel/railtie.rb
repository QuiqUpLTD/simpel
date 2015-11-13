module Simpel
  class Railtie < ::Rails::Railtie
    initializer "simpel.registry" do
      Rails.logger.debug 'Registry'
    end

    config.to_prepare do
      Rails.logger.debug 'Simpel prepare'
    end
  end
end