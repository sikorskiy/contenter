class AddReferenceToContentCamps < ActiveRecord::Migration[5.2]
  def change
    add_reference :content_camps, :user
  end
end
