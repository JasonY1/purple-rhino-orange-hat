class RemovePrescriptionIdFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :prescription_id, :string
  end
end
