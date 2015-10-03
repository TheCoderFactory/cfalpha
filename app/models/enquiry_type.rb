class EnquiryType < ActiveRecord::Base
	has_many :enquiries, dependent: :restrict_with_exception

end
