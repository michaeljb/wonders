class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.string :name
      t.column :side, :string, :limit => 1
    end
  end

  def self.down
    drop_table :boards
  end
end
