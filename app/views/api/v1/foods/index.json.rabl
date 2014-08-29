object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:foods_count) { @foods.size }
  child @foods do
    attributes :id, :ndb_no, :food_group_code, :long_description, :short_description, :common_name, :company_name, :survey, :refuse_description, :refuce, :scientific_name, :nitrogen_factor, :protein_factor, :fat_factor, :cho_factor, :food_group_id
  end
end