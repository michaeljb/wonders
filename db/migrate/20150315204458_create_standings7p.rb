class CreateStandings7p < ActiveRecord::Migration
  def self.up
    create_table :standings7p do |t|
      t.integer :player

      t.integer :games_played

      t.float :ranking_avg

      (2..14).each do |n|
        t.integer :"#{n / 2.0}"
      end
    end
  end

  def self.down
    drop_table :standings7p
  end
end
