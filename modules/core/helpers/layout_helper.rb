module Core
  module Helpers
    module Layout
      def render_cell(position, *args)
        begin
          cell(position, *args).render
        rescue Glia::Errors::MissingCellError
          ''
        end
      end

      def cell_exec(name = nil, &blk)
        if name.nil?
          init_haml_helpers
          content = ''
          self.blocks.each{ |b| content += capture_haml(self, &b)||'' }
          content
        else
          begin
            layout.cell(name).blocks << blk
          rescue Glia::Errors::MissingCellError
            nil
          end
        end
      end
    end
  end
end
