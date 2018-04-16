class CreateVotingOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :voting_options do |t|
      t.integer :issue
      t.string :name
      t.string :desc
      t.integer :vote_count

      t.timestamps
    end
  end
end
