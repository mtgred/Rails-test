class AccountCategory < ActiveRecord::Base
  has_many :accounts
end
