class Storage < ActiveRecord::Base
	belongs_to :entry
	has_one :vote
end
