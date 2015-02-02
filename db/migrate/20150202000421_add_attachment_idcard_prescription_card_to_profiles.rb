class AddAttachmentIdcardPrescriptionCardToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :idcard
      t.attachment :prescription_card
    end
  end

  def self.down
    remove_attachment :profiles, :idcard
    remove_attachment :profiles, :prescription_card
  end
end
