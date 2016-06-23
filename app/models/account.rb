class Account < ActiveRecord::Base

	# Autocode: Callback

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable

 	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  # Autocode: Relationships
  has_many :authtokens, dependent: :destroy

	# File Upload

  # Autocode: Validations

	# Soft Destroy
end
