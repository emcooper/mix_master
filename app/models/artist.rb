class Artist < ApplicationRecord
  validates_presence_of :name, :image_path
  validates_uniqueness_of :name
end
