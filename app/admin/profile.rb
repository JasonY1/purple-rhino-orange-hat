ActiveAdmin.register Profile do
  permit_params :firstname, :lastname, :address1, :address2, :city, :statename, :zipcode, :phonenum, :prescription_num, :prescription_exp, :prescription_card, :idcard, :verified  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
