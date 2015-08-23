require 'modules/core/helpers/layout_helper'
require 'modules/core/helpers/registry_helper'
require 'modules/core/helpers/routes_helper'
require 'modules/core/helpers/exposures_helper'
require 'action_view'
module Core
  module Cells
    class Base < Cell::ViewModel

      include Glia::Cell
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::FormHelper
      include Core::Helpers::Routes
      include Core::Helpers::Layout
      include Core::Helpers::Registry
      include Core::Helpers::Exposures

      def find_template(options)
        template_options = template_options_for(options) # imported by Erb, Haml, etc.
        # required options: :template_class, :suffix. everything else is passed to the template implementation.

        suffix    = '.'+template_options.delete(:suffix)
        name      = (options[:partial] || self.template_name)+suffix
        prefixes  = options[:prefixes]

        template_for(prefixes, name, template_options) or raise ::Cell::TemplateMissingError.new(prefixes, name)
      end

      def _prefixes
        themes.reverse.map{|theme| File.join(templates_root, theme.to_s)}
      end

      def template_options_for(options)
        {
            template_class: ::Tilt::HamlTemplate,
            escape_html:    false,
            escape_attrs:   false,
            suffix:         "html.haml"
        }
      end

      def templates_root
        File.join(Application.root, 'templates')
      end

    end
  end
end
