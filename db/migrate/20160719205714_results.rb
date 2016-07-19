class Results < ActiveRecord::Migration
  def change
    create_table(:results) do |t|
      t.integer(:q1_a1)
      t.integer(:q1_a2)
      t.integer(:q1_a3)
      t.integer(:q1_a4)
      t.integer(:q2_a1)
      t.integer(:q2_a2)
      t.integer(:q2_a3)
      t.integer(:q2_a4)
      t.integer(:q3_a1)
      t.integer(:q3_a2)
      t.integer(:q3_a3)
      t.integer(:q3_a4)
      t.integer(:counter)
      t.timestamps()
    end
  end
end
