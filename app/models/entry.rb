class Entry < ActiveRecord::Base
	# scope :created_after, ->(time) { where("entries.created_at >= ?", time.yesterday } same as self.created_after
	def self.created_after(time)
		# You need the real table name in the where() filter: WHEN YOU DO MERGE, so entries.created_at...
		where("entries.created_at >= ?", time.yesterday) # USE: @posts1 = Entry.all.created_after(Time.now)
	end

	belongs_to :user
	belongs_to :category
	has_one :storage

	accepts_nested_attributes_for :storage
end
