object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:food_data_sources_count) { @food_data_sources.size }
  child @food_data_sources do
    attributes :id, :ndb_no, :nutrient_no, :data_source_id, :food_id, :nutrient_id
  end
end