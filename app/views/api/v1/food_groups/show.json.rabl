object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:food_groups_count) { 1 }
  child @food_group do
    attributes :id, :description
  end
end