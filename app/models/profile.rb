class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :valid_id_file_name
  
  validates_presence_of :firstname, :lastname
  
  ######################################################
  # Paperclip Image Attachment
  
  has_attached_file :prescription_id,
    styles: { normal: "400x400#", bigger: "700x700#" },
    default_style: :normal,
    preserve_files: true,
    processors: [:thumbnail, :compression]

  validates_attachment :prescription_id, content_type: { content_type: /^image\/(jpeg|png|gif|tiff|jpg)$/ }
  
  has_attached_file :valid_id,
    styles: { normal: "400x400#", bigger: "700x700#" },
    default_style: :normal,
    preserve_files: true,
    processors: [:thumbnail, :compression]

  validates_attachment :valid_id, content_type: { content_type: /^image\/(jpeg|png|gif|tiff|jpg)$/ }
end
