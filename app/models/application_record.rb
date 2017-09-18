class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # if item is filed
  def self.filed(_filed = false)
    where(deleted: _filed)
  end
  # if is active
  def self.published
    where(status: true, deleted: false)
  end
end
