json.extract! contact, :id, :user_id, :first_name, :last_name, :middle_name, :preferred_name, :email, :primary_phone, :secondary_phone, :text_messages, :street_address, :city, :state, :zip_code, :created_at, :updated_at
json.url contact_url(contact, format: :json)
