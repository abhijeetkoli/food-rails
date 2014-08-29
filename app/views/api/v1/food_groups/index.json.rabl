object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:food_groups_count) { @food_groups.size }
  child @food_groups do
    attributes :id, :description
  end
end