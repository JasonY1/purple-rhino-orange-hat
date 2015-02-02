class AddPrescriptionCardToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :prescription_card, :string
  end
end
