class CreateCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :actor, null: false, foreign_key: true

      t.timestamps

      t.index [:movie_id, :actor_id], unique: true
    end
  end
end
