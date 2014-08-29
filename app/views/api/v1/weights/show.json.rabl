object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:weights_count) { 1 }
  child @weight do
    attributes :id, :ndb_no, :sequence, :amount, :description, :gram_weight, :data_points, :standard_deviation, :food_id
  end
end