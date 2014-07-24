json.array!(@consultations) do |consultation|
  json.extract! consultation, :id, :code, :libelle, :debut, :fin
  json.url consultation_url(consultation, format: :json)
end
