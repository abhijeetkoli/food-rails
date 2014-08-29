object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:users_count) { @users.size }
  child @users do
    attributes :id, :name, :picture_url
  end
end