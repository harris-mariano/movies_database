class ChangeSummaryToStoryFromMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :summary, :story
  end
end
