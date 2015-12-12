class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # Paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)

  #associtation
  has_many :targets, dependent: :destroy

  def full_profile?
    avatar? && family_name? && first_name? && family_name_kana? && first_name_kana?
  end

  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end
end
