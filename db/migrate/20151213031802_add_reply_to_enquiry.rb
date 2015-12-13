class AddReplyToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :reply, :text
    add_column :enquiries, :reply_sent, :datetime
    add_column :enquiries, :archived, :datetime
    add_column :enquiries, :added_to_crm, :datetime
    add_column :enquiries, :added_to_mailchimp, :datetime
  end
end
