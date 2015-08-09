require 'modules/core/helpers/layout_helper'
require 'modules/core/helpers/registry_helper'
module Core
  module Cells

    class Base < Cell::ViewModel

      include Glia::Cell
      include Core::Helpers::Layout
      include Core::Helpers::Registry

      def find_template(options)
        Tilt.new(template_file, options) or raise StandardError, 'Missing Template: '+template_file
      end

      def template_file
        #@todo: More dynamic template file retrieval with multiple template types and output types, use cells templates
        # finding logic
        File.join(Application.root, 'templates', self.template_name+'.html.haml')
      end

    end

  end
end
