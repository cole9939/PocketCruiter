class Template < ActiveRecord::Base

  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }
end
