module Michibiki
  class Engine < ::Rails::Engine
    isolate_namespace Michibiki
    config.i18n.load_path += Dir[Engine.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
