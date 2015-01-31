json.array!(@developers) do |developer|
  json.extract! developer, :id, :name, :email, :password
  json.url developer_url(developer, format: :json)
end
