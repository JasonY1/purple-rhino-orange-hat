ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :email
  end
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

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.inputs "Profile Details", for: [:profile, f.user.profile || Profile.new] do |p|
        p.input :verified
        p.input :firstname
        p.input :lastname
        p.input :address1
        p.input :address2
        p.input :city
        p.input :statename
        p.input :zipcode
        p.input :birthdate, as: :datepicker, datepicker_options: { min_date: 100.years.ago.to_date, max_date: "-18Y"}
        p.input :phonenum
        p.input :prescription_id
        p.input :prescription_num
        p.input :prescription_exp
        p.input :valid_id
      end
      f.actions
    end
  end
end
