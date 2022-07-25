ActiveAdmin.register Pod do

permit_params :name, :phone_number, :status, grades: [], picture_attributes: [:id, :image], address_attributes: [:id, :street, :city, :state, :zipcode, :country]

form do |f|
    f.inputs 'pod' do
      f.input :name
      f.input :phone_number
      f.select :grades, ApplicationRecord::Grade, { prompt: "Please select" }, { multiple: true }
      f.input :status
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

show do
	panel "Pod" do
      table_for pod do
      column :name
      column :phone_number
      column :grades
      column "Street" do |pod|
          pod.address.street
      end
      column "City" do |pod|
          pod.address.city
      end
      column "State" do |pod|
          pod.address.state
      end
      column "Zipcode" do |pod|
          pod.address.zipcode
      end
      column "Country" do |pod|
          pod.address.country
      end
      column "Image" do |pod|
         image_tag(pod.picture.image, size: "50x50")
      end
      end
      end
    end

end
