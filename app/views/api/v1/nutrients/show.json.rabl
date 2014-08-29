object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:nutrients_count) { 1 }
  child @nutrient do
    attributes :id, :nutrient_no, :units, :tag_name, :descritpion, :decimal_places, :sr_order
  end
end