ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

    permit_params :title, :content, :thumbnail, :category_ids => []

    form do |f|
        f.inputs do
            f.input :title
            f.input :content, as: :ckeditor
            f.input :categories, as: :check_boxes, :collection => Category.all.map{|cat| [cat.title, cat.id]}
            f.input :thumbnail
        end
        f.actions
    end
end
