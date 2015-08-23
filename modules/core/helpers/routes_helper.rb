module Core
  module Helpers
    module Routes

      def path(*args)
        Application.router.path(*args)
      end

    end
  end
end
