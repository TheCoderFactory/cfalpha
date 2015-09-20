class AddCodeToEnquiryType < ActiveRecord::Migration
  def change
    add_column :enquiry_types, :code, :string
  end
end
