class HighScore < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :score
end
