class CreateHighScores < ActiveRecord::Migration
  def self.up
    create_table :high_scores do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :high_scores
  end
end
