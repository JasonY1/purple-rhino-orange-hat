class AddIdentificationToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :idcard, :string
  end
end
