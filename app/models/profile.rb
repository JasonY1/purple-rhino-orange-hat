class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :firstname, :lastname, :birthdate, :phonenum, :prescription_num, :prescription_exp
end
