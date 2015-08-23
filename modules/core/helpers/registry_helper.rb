module Core
  module Helpers
    module Registry

      def self.included(base)
        base.instance_eval do

          def subscribe(*exposures)
            exposures.each do |exposure|
              define_method exposure do
                exposures[exposure]
              end
            end
          end

          def exposures
            RequestStore.store[:action_exposures]
          end

        end
      end

    end
  end
end
