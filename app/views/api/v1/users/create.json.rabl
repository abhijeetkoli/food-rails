object false
node (:success) { true }
node (:info) { 'User created!' }
child :data do
  child @user do
    attributes :id, :name, :picture_url
  end
end