json.array!(@etablissements) do |etablissement|
  json.extract! etablissement, :id, :nom
  json.url etablissement_url(etablissement, format: :json)
end
