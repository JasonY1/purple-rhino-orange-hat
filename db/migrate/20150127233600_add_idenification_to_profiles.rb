class AddIdenificationToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :valid_id, :string
  end
end
