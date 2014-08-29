object false
node (:success) { true }
node (:info) { 'Device Registered!' }
child :data do
  child @device do
    attributes :id, :user_id, :company_id, :created_at
  end
end