class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.integer :creator
      t.string :text

      t.timestamps
    end
  end
end
