class Group < ActiveRecord::Base
  # belongs_to :event
  # belongs_to :group
  has_many :event_groupships
  has_many :events, :through => :event_groupships
end
