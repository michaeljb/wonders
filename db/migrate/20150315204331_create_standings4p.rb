class CreateStandings4p < ActiveRecord::Migration
  def self.up
    create_table :standings4p do |t|
      t.integer :player

      t.integer :games_played

      t.float :ranking_avg

      t.integer :'1'
      t.integer :'1.5'
      t.integer :'2'
      t.integer :'2.5'
      t.integer :'4'
      t.integer :'4.5'
      t.integer :'4'
    end
  end

  def self.down
    drop_table :standings4p
  end
end
