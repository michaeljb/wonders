class CreateStandings5p < ActiveRecord::Migration
  def self.up
    create_table :standings5p do |t|
      t.integer :player

      t.integer :games_played

      t.float :ranking_avg

      t.integer :'1'
      t.integer :'1.5'
      t.integer :'2'
      t.integer :'2.5'
      t.integer :'5'
      t.integer :'5.5'
      t.integer :'4'
      t.integer :'4.5'
      t.integer :'5'
    end
  end

  def self.down
    drop_table :standings5p
  end
end
