require "reform/form/validation/unique_validator"

class UserForm < Reform::Form
  property :email
  property :first_name
  property :last_name
  property :code
  property :mobile_number
  property :address
  property :national_code
  property :birth_date
  property :mobile_verified
  property :user_type
  property :mobile_verify_token
  property :user_name
  property :password, virtual: true
  property :fcm_token
  property :avatar
  property :face_image

  validates :code, presence: true
  # validates :mobile_number, presence: true
  validates :user_type, presence: true
  validates :user_name, presence: true
  # validates :password, presence: true
  validate :unique_mobile_number
  validate :unique_email

  private

  def unique_mobile_number
    return if mobile_number.to_s == ''
    return unless Rw::User.where('mobile_number = ? and id <> ?', mobile_number, id.to_i).count > 0

    errors.add(:mobile_number, I18n.t(:'activemodel.errors.models.user.attributes.mobile_number.taken'))
  end

  def unique_email
    return if email.to_s == ''
    return unless Rw::User.where('email = ? and id <> ?', email, id.to_i).count > 0

    errors.add(:email, I18n.t(:'activemodel.errors.models.user.attributes.email.taken'))
  end
end