module Core
  module Action
    module Layout

      class CellFactory < Glia::ViewFactory
        def instantiate(klass, definition, *args)
          args = args.empty? ? [nil] : args
          klass.new(*(args|[definition]))
        end
      end

      def self.included(base)
        base.class_eval do
          expose :handles
        end
      end

      def layout
        @layout ||= Glia.layout(:frontend, handles, view_factory: CellFactory.new)
      end

      def handles
        if @handles.nil?
          (controller, *action) = self.class.name.split('::');
          @handles = [:default, controller.downcase.to_sym, ([controller]|action).join('_').downcase.to_sym]
        end
        @handles
      end

    end
  end
end
