# frozen_string_literal: true

json.extract! user, :id, :user_name, :email, :password_digest, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
