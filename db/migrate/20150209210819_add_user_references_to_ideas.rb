class AddUserReferencesToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :user, index: true
    add_foreign_key :ideas, :users
  end
end
