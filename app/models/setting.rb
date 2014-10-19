class Setting < ActiveRecord::Base
  validate :name, uniqueness: true, presence: true
  validate :value, presence: true
  validate :data_type, presence: true

  def self.get(setting_name)
    setting = Setting.where(name: setting_name).first
    setting && setting.value.send(setting.data_type)
  end
end
