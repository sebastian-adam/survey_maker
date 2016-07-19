class DeleteAColumn < ActiveRecord::Migration
  def change
    remove_column(:questions, :a)
  end
end
