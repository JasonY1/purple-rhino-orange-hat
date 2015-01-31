class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :firstname, :lastname
  
  ######################################################
  # Paperclip Image Attachment
  
  has_attached_file :prescription_id,
    styles: { normal: "400x400#", bigger: "700x700#" },
    url: '/photos/profiles/prescription_id/:id/:style_:basename.:extension',
    default_style: :normal,
    preserve_files: true,
    processors: [:thumbnail, :compression]

  validates_attachment :prescription_id, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  has_attached_file :valid_id,
    styles: { normal: "400x400#", bigger: "700x700#" },
    url: '/photos/profiles/coverpics/:id/:style_:basename.:extension',
    default_style: :normal,
    preserve_files: true,
    processors: [:thumbnail, :compression]

  validates_attachment :valid_id, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
