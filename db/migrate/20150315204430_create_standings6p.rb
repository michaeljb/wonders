class CreateStandings6p < ActiveRecord::Migration
  def self.up
    create_table :standings6p do |t|
      t.integer :player

      t.integer :games_played

      t.float :ranking_avg

      (2..12).each do |n|
        t.integer :"#{n / 2.0}"
      end
    end
  end

  def self.down
    drop_table :standings6p
  end
end
