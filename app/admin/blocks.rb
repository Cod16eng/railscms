ActiveAdmin.register Block do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :show_title, :body, :position, :display, :order, :class_suffix, :is_published
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
	column :id
	column :title, :sortable => :title
	column :position, :sortable => :position
	column :show_title, :sortable => :show_title
	column :display, :sortable => :display
	column :created_at, :sortable => :created_at
	column :order
	column :body do |block|
        block.body[0...50]
      end
	actions
	end

form do |f|
	f.inputs "Details" do
		f.input :title, :label => "Title"
		f.input :show_title, :label => "Show Title"
		f.input :body, as: :html_editor, :label => "Body"
		f.input :position, :label => "Position", :as => :select, :collection => [["Jumbotron", "jumbotron"], ["Block", "block"]]
		f.input :display, :label => "Display", :as => :select, :collection => [["All pages", "all"], ["Homepage Only", "home"], ["All but Homepage", "nohome"]]
		f.input :order, :label => "Order"
		f.input :is_published, :label => "Is published"
		f.input :class_suffix, :label => "Class Suffix"
		f.actions
	end
end

end
