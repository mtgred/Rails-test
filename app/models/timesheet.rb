class Timesheet < ActiveRecord::Base
  validates :user, :presence => true
  validates :account, :presence => true
  validates :day, :presence => true
  belongs_to :user
  belongs_to :account
end
