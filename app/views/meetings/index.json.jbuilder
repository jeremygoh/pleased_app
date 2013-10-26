json.array!(@meetings) do |meeting|
  json.extract! meeting, :date
  json.url meeting_url(meeting, format: :json)
end
