object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:source_codes_count) { @source_codes.size }
  child @source_codes do
    attributes :id, :description
  end
end