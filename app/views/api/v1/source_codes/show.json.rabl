object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:source_codes_count) { 1 }
  child @source_code do
    attributes :id, :description
  end
end