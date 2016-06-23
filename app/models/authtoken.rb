class Authtoken < ApplicationRecord
	has_secure_token :token
  # Autocode: Relationships
  belongs_to :account
  # Autocode: Validations

  # Autocode: Callbacks

	# File Upload

	# Soft Destroy


	def self.create_auth_token(account_id,remote_ip, user_agent, device_id)
		self.create!(account_id: account_id, last_used_at: Time.now.utc, sign_in_ip: remote_ip, user_agent: user_agent, device_id: device_id)
	end

	def self.destroy_auth_token(account_token)
		self.find_by_token(account_token).destroy
	end

end
