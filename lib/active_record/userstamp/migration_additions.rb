module ActiveRecord::Userstamp::MigrationHelper
  extend ActiveSupport::Concern

  def userstamps(*args)
    config = ActiveRecord::Userstamp.config
    column(config.creator_attribute, config.user_id_default_class, *args)
    column(config.updater_attribute, config.user_id_default_class, *args)
    column(config.deleter_attribute, config.user_id_default_class, *args) if config.deleter_attribute.present?
  end
end

ActiveRecord::ConnectionAdapters::TableDefinition.class_eval do
  include ActiveRecord::Userstamp::MigrationHelper
end
