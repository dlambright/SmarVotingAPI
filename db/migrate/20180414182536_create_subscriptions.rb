class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :user
      t.integer :issue

      t.timestamps
    end
  end
end
