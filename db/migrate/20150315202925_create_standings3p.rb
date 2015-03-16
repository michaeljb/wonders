class CreateStandings3p < ActiveRecord::Migration
  def self.up
    create_table :standings3p do |t|
      t.integer :player

      t.integer :games_played

      t.float :ranking_avg

      (2..6).each do |n|
        t.integer :"#{n / 2.0}"
      end
    end
  end

  def self.down
    drop_table :standings3p
  end
end
