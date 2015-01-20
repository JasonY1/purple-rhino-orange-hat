class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile
  
  validates_presence_of :firstname, :lastname, :birthdate, :phonenum, :prescription_num, :prescription_exp
end
