module Simpel
  class Railtie < ::Rails::Railtie
    initializer "simpel.registry" do
      Simpel.clear_registry
    end

    config.to_prepare do
      Simpel.reload! unless Simpel.registry.empty?
    end
  end
end