class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :week_days, :specialty, :category_id, :user_id, :created_at, :updated_at
end
