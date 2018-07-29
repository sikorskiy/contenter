class AddReferenceToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :camp
  end
end
