class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :voting_option
      t.integer :parent
      t.string :body
      t.string :user
      t.integer :indent

      t.timestamps
    end
  end
end
