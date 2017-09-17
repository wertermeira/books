class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.filed(_filed = false)
    where(deleted: _filed)
  end

end
