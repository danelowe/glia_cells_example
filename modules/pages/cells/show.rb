module Pages
  module Cells
    class Show < Core::Cells::Template

      def find_template(options)
        template_options = template_options_for(options)
        template_options.delete(:suffix)
        file = page.file_name
        template_for(
            [File.dirname(file)], File.basename(file), template_options
        ) or raise ::Cell::TemplateMissingError.new(prefixes, name)
      end

    end
  end
end
