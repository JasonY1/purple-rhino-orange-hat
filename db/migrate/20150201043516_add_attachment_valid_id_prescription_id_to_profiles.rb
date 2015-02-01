class AddAttachmentValidIdPrescriptionIdToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :valid_id
      t.attachment :prescription_id
    end
  end

  def self.down
    remove_attachment :profiles, :valid_id
    remove_attachment :profiles, :prescription_id
  end
end
