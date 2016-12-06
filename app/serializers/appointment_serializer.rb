class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :initial_time, :final_time, :description, :service_id, :user_id
end
