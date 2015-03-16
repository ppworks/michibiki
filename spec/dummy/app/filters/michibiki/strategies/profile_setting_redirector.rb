module Michibiki
  module Strategies
    class ProfileSettingRedirector < Michibiki::Base
      private
      def trigger_conditions
        true
      end

      def redirect_path
        '/profile/edit'
      end
    end
  end
end
