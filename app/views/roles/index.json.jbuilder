json.array!(@roles) do |role|
  json.extract! role, :id, :name, :descriptin
  json.url role_url(role, format: :json)
end
