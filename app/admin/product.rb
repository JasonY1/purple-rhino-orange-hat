ActiveAdmin.register Product do
  permit_params :title, :description, :type, :strain, :thc, :image_url, :link, :inventory, :ppunit, :ppgram, :ppeighth, :ppquad, :pphalf, :ppoz, :slug, :show

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

    has_attached_file :image_url
    styles: { normal: "1000x1000#", thumb: "300x300#" },
    url: '/photos/products/image_url/:id/:style_:basename.:extension',
    default_style: :normal,
    preserve_files: true,
    processors: [:thumbnail, :compression]
end
