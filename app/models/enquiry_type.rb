class EnquiryType < ActiveRecord::Base
	has_many :enquiries, dependent: :restrict_with_exception
	has_paper_trail
end
