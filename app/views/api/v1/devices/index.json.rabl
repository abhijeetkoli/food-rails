object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:devices_count) { @devices.size }
  child @devices do
    attributes :id, :user_id, :company_id, :token, :enabled, :platform, :created_at
  end
end