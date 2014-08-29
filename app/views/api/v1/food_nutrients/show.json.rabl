object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:food_nutrients_count) { 1 }
  child @food_nutrient do
    attributes :id, :ndb_no, :nutrient_no, :value, :data_points, :standard_error, :reference_ndb_no, :added_nutrient_mark, :studies, :minimum_value, :maximum_value, :df, :lower_eb, :upper_eb, :statistical_comments, :confidence_code, :food_id, :nutrient_id, :source_code, :derivation_code
  end
end