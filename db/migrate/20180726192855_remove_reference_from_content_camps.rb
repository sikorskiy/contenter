class RemoveReferenceFromContentCamps < ActiveRecord::Migration[5.2]
  def change
    remove_reference :content_camps, :camps, index: true
  end
end
