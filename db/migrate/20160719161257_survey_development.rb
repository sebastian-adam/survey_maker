class SurveyDevelopment < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.string(:title)
      t.timestamps()
    end

    create_table(:questions) do |t|
      t.string(:q)
      t.string(:a)
      t.integer(:survey_id)
      t.timestamps()
    end
  end
end
