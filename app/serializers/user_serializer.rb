class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :telephone, :cellphone, :created_at, :updated_at, :auth_token
end
