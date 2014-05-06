ActiveAdmin.register Template do

  permit_params :title, :description, :is_active

  scope :all, :default => true
  scope :active
  scope :inactive
  
  index do |d|         
    column :id
    column :title
    column :is_active
   
    default_actions             
  end 

  filter :id
  filter :title
  
  show do |task|
    panel "Email template details" do
      attributes_table_for task do
        row("Subject") { task.title }
        row("Body") { task.description.html_safe }
        row("Active") { status_tag (task.is_active ? "Done" : "Pending"), (task.is_active ? :ok : :error) }
      end
    end
  end
    
  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :html_editor
      f.input :is_active, :label => 'Active'
    end

    f.actions    
  end
  
end
