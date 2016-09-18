class Newsletter < ActiveRecord::Base
  has_many :entries
end