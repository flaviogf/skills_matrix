class CreateDeveloperSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :developer_skills do |t|
      t.references :developer, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
