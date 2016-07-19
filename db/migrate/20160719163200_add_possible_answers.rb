class AddPossibleAnswers < ActiveRecord::Migration
  def change
    add_column(:questions, :pa1, :string)
    add_column(:questions, :pa2, :string)
    add_column(:questions, :pa3, :string)
    add_column(:questions, :pa4, :string)
  end
end
