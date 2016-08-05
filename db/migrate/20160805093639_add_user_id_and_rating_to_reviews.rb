class AddUserIdAndRatingToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :user, index: true, foreign_key: true
    add_column :reviews, :rating, :float
  end
end
