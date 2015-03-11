class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.date :date

      t.integer :player_count

      # using expansions?
      t.boolean :cities
      t.boolean :leaders

      (1..8).to_a.each do |n|
        # foreign key - Players
        t.integer :"player#{n}"

        [
          # foreign key - Boards
          :board,

          # scoring categories
          :military,
          :treasury,
          :wonder,
          :civilian,
          :science,
          :commercial,
          :guilds,
          :leaders,
          :city,
          :total,

          # ordinal ranking of the 'total' column
          :ranking
        ].each do |column|
          t.integer :"#{column}_p#{n}"
        end
      end
    end
  end

  def self.down
    drop_table :games
  end
end
