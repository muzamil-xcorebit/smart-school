ActiveAdmin.register Teacher do

permit_params :name, :phone_number, :pod_id, picture_attributes: [:id, :image], address_attributes: [:id, :street, :city, :state, :zipcode, :country]

  form do |f|
    f.inputs 'teacher' do
      f.input :name
      f.input :phone_number
      f.input :pod_id, as: :select, collection: Pod.select(:id, :name)
      f.has_many :picture, heading: 'Picture',
                              allow_destroy: true do |a|
      a.input :image, as: :file
      end
      f.has_many :address, heading: 'Address',
                              allow_destroy: true do |ad|
      ad.input :street
      ad.input :city
      ad.input :state
      ad.input :zipcode
      ad.input :country, as: :string
      end
end
  f.actions
end

   index do
      selectable_column
      column :name
      column :phone_number
      column "Street" do |teacher|
          teacher.address.street
      end
      column "City" do |teacher|
          teacher.address.city
      end
      column "State" do |teacher|
          teacher.address.state
      end
      column "Zipcode" do |teacher|
          teacher.address.zipcode
      end
      column "Country" do |teacher|
          teacher.address.country
      end
      actions
   end

   show do
	panel "Teacher" do
      table_for teacher do
      column :name
      column :phone_number
      column "Street" do |teacher|
          teacher.address.street
      end
      column "City" do |teacher|
          teacher.address.city
      end
      column "State" do |teacher|
          teacher.address.state
      end
      column "Zipcode" do |teacher|
          teacher.address.zipcode
      end
      column "Country" do |teacher|
          teacher.address.country
      end
      column "Image" do |teacher|
         image_tag(teacher.picture.image, size: "50x50")
      end
      end
      end
    end

end
