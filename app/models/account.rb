class Account < ActiveRecord::Base
  has_ancestry
  validates :name, :presence => true
  has_many :timesheets
  belongs_to :category, :class_name => "AccountCategory"
end
