json.array!(@stories) do |story|
  json.extract! story, :id, :title, :description, :point, :stages
  json.url story_url(story, format: :json)
end
