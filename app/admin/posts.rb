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
menu label: "Articles", priority: 2, parent: "Blog parent"

    permit_params :title, :content, :thumbnail, :category_ids => []

    form do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs do
            f.input :title
            f.input :content, as: :ckeditor
            f.input :categories, as: :check_boxes, :collection => Category.all.map{|cat| [cat.title, cat.id]}
            f.input :thumbnail
        end
        f.actions
    end

    index do
        selectable_column
        id_column
        column :title do |post|
            link_to post.title, admin_post_path(post)
        end
        column :categories do |post|
            post.categories.map {|c| link_to(c.title, admin_category_path(c))}.join(", ").html_safe
        end
        column :thumbnail do |post|
            image_tag post.thumbnail_url, size: "100x100" if post.thumbnail.present?
        end
        column :created_at
        column :updated_at
        actions
    end

    show do
        attributes_table do
            row :title
            row :content do |post|
                raw post.content
            end
            row :thumbnail do |post|
                image_tag post.thumbnail_url if post.thumbnail.present?
            end
            row :created_at
            row :updated_at
        end
        active_admin_comments
    end

end
