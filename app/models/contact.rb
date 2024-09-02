class Contact < ApplicationRecord
  validates :last_name, presence: true

  def full_name
    return last_name if first_name.blank?

    "#{first_name} #{last_name}"
  end
end
