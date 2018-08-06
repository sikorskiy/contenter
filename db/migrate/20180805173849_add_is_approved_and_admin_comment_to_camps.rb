class AddIsApprovedAndAdminCommentToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :admin_comment, :string
    add_column :camps, :is_approved, :boolean
  end
end
