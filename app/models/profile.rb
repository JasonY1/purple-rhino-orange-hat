class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :firstname, :lastname, :address1, :city, :statename, :zipcode, :phonenum, :prescription_num, :prescription_card, :idcard, on: :update
  
  ######################################################
  # Paperclip Image Attachment
  
  has_attached_file :prescription_card,
    styles: { normal: "400x400#", bigger: "700x700#" },
    default_style: :normal,
    preserve_files: true

  validates_attachment_content_type :prescription_card, content_type: /^image\/(jpeg|png|gif|tiff|jpg)$/
  
  has_attached_file :idcard,
    styles: { normal: "400x400#", bigger: "700x700#" },
    default_style: :normal,
    preserve_files: true

  validates_attachment_content_type :idcard, content_type: /^image\/(jpeg|png|gif|tiff|jpg)$/
  
end
