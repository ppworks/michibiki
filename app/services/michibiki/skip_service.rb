class Michibiki::SkipService
  include ActiveModel::Model

  attr_accessor :skip_strategy
  validate :check_strategy

  def session_name
    name_format = Michibiki::Base::SKIP_SESSION_NAME_FORMAT
    format(name_format, underscored_class_name: skip_strategy)
  end

  private

  def check_strategy
    ::Michibiki::Strategies.const_get(skip_strategy.classify)
  rescue NameError
    errors.add(:invalid_strategy, I18n.t('michibiki.skip_failure'))
  end
end
