module Michibiki
  class SkipsController < ::ApplicationController
    def update
      skip_service = Michibiki::SkipService.new(skip_strategy: params[:skip_strategy])
      if skip_service.valid?
        session[skip_service.session_name] = Time.current
        redirect_to root_path
      else
        head :not_found
      end
    end
  end
end
