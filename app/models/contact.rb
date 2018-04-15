class Contact < ApplicationRecord

  has_one :user
  has_many :attendances
  accepts_nested_attributes_for :attendances, reject_if: :all_blank, allow_destroy: true
  has_many :events, through: :attendances
  has_one :client


  def last_first_name
    return "#{last_name}, #{first_name}"
  end

  def legal_full_name
    name = "#{first_name} #{last_name}"
    if name == " "
      return self.user.email.gsub(/@.*/,"").titleize
    else
      return name.titleize
    end
  end

  def preferred_full_name
    if preferred_name == ""
      preferred = first_name
    else
      preferred = preferred_name || first_name
    end
    name = "#{preferred} #{last_name}"
    if name == " "
      if self.user == nil
        return "Not Available"
      else
        return self.user.email.gsub(/@.*/,"").titleize
      end
    else
      return name.titleize
    end
  end

end
