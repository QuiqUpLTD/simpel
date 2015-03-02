module Simpel
  module MsgPackRenderable
    # Options include:
    # :only => [:col1, :col2] # Specify which columns to include
    # :except => [:col1, :col2] # Specify which columns to exclude
    # :add_methods => [:method1, :method2] # Include addtional methods that aren't columns
    def to_mpack(options = {})
    end
  end
end