class User < ApplicationRecord
  has_secure_password
  # has_many :foods 
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  before_create {generate_token(:auth_token)}

  # mount_uploader :image, ImageUploader

  def user?
      self.type == "User"
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  	def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(
           email: data['email'],
           password: SecureRandom.hex
        )
    end
    user
end
end
