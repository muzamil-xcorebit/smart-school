ActiveAdmin.register ChildPod do

permit_params :status, :child_id, :pod_id

form do |f|
  f.inputs 'child_pod' do
    f.input :status
  end
  f.actions
end

end
