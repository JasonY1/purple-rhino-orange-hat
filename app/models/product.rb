class Product < ActiveRecord::Base
  has_many :green
  has_many :concentrate
  has_many :edible
end
