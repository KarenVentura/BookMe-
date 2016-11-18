class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :week_days, :category_id, :user_id
end
