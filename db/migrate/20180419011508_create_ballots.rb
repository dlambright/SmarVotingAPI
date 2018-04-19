class CreateBallots < ActiveRecord::Migration[5.0]
  def change
    create_table :ballots do |t|
      t.integer :user
      t.integer :issue
      t.integer :voting_option

      t.timestamps
    end
  end
end
