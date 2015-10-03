class AddImportantToEnquiryType < ActiveRecord::Migration
  def change
    add_column :enquiry_types, :important, :boolean, default: false
  end
end
