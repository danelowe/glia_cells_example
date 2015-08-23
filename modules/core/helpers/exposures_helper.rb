module Core
  module Helpers
    module Exposures

      def respond_to_missing?(m, include_all)
        action_exposures.key?(m) || @options.key?(m)
      end

      protected

      def action_exposures
        @action_exposures ||= (::RequestStore.store[:action_exposures]||{})
      end

      def method_missing(m, *args, &block)
        if @options.key?(m)
          @options[m]
        elsif action_exposures.key?(m)
          action_exposures[m]
        else
          super
        end
      end

    end
  end
end
