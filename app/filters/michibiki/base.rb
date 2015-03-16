# ex.) before_action Michibiki::Strategies::ProfileSettingRedirector
module Michibiki
  class Base
    SKIP_SESSION_NAME_FORMAT = 'skip_%{underscored_class_name}_at'
    attr_reader :controller

    class << self
      def before(c)
        new(c)
      end
    end

    def initialize(c)
      @controller = c
      controller.redirect_to(redirect_path, redirect_options) if trigger?
    end

    private
    def trigger?
      return false unless controller.request.get?
      return false if controller.request.path == redirect_path
      return false if skip?
      trigger_conditions
    end

    def trigger_conditions
      true
    end

    def redirect_path
      '/'
    end

    def skip?
      skip_session.present?
    end

    def skip_session
      controller.session[skip_session_name]
    end

    def skip_session_name
      format(SKIP_SESSION_NAME_FORMAT, underscored_class_name: self.class.name.demodulize.underscore)
    end

    def redirect_options
      {}
    end
  end
end
