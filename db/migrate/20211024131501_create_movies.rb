class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_year
      t.string :genre
      t.string :director
      t.text :summary

      t.timestamps
    end
  end
end
