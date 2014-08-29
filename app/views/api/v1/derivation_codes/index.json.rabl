object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:derivation_codes_count) { @derivation_codes.size }
  child @derivation_codes do
    attributes :id, :code, :description
  end
end