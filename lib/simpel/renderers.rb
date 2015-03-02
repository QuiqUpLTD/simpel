# module Simpel
#   class RenderJsonRailtie < ::Rails::Railtie
#     config.after_initialize do
#       require 'simpel/json_renderable'
#       require 'action_controller/metal/renderers'
#
#       ActionController.add_renderer :json do |json, options|
#         filename = options[:filename] || options[:template]
#         json.extend RenderCsv::CsvRenderable unless json.respond_to?(:to_csv)
#         data = json.to_json(options)
#         send_data data, type: Mime::CSV, disposition: "attachment; filename=#{filename}.json"
#       end
#     end
#   end
# end

# ActionController::Renderers.add :json do |object, options|
#   json = object.respond_to?(:to_simpel_json) ? ::Simpel.serialize(object, options[:format]) : object
#   self.content_type ||= Mime::JSON
#   self.response_body = json
# end
