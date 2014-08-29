object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:derivation_codes_count) { 1 }
  child @derivation_code do
    attributes :id, :code, :description
  end
end