object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:users_count) { @user.size }
  child @user do
    attributes :id, :name, :picture_url
  end
end