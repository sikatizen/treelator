class Translation < ActiveRecord::Base
  belongs_to :locale
  belongs_to :key
end
