class Collection < ActiveRecord::Base
	has_many :pics
	has_many :xls
	has_many :information
end
