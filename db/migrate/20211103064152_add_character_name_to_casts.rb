class AddCharacterNameToCasts < ActiveRecord::Migration[6.0]
  def change
    add_column :casts, :character_name, :string
  end
end
