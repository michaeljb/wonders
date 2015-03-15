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

        # ranking points earned this game; 1 for first, 2 for second, etc.
        #
        # ties split points, i.e. if 2 players tie for first, they split the
        # points earned by first and second place, so they each earn 1.5
        t.float :"ranking_p#{n}"

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
          :total
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
