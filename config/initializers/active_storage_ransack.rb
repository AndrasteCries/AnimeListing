ActiveSupport.on_load(:active_storage_attachment) do
  ActiveStorage::Attachment.define_singleton_method(:ransackable_attributes) do |auth_object = nil|
    ["blob_id", "created_at", "id", "id_value", "name", "record_id", "record_type"]
  end
end