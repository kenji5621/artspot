class Product < ActiveRecord::Base
	has_attached_file :image
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    do_not_validate_attachment_file_type :avatar
end
