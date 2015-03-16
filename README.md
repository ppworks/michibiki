# Michibiki

## sample code

```Gemfile
gem 'michibiki'
```

```routes.rb
Rails.application.routes.draw do
  resource :profile, only: %i(edit)
  mount Michibiki::Engine => "/michibiki"
end
```

```app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_filter Michibiki::Strategies::ProfileEditing
end
```

```app/filters/michibiki/strategies/profile_editing.rb
class Michibiki::Strategies::ProfileEditing < Michibiki::Base
  private
  def trigger_conditions
    retuen unless current_user
    !current_user.ready_profile?
  end

  def redirect_path
    '/profile/edit'
  end
end
```

```app/views/profiles/edit.html.slim
= form_for(@user) do |f|
  = f.text_field :nickname
  = f.submit

= form_tag michibiki.skip_path('profile_setting_redirector'),  method: :put do
  button skip
```
