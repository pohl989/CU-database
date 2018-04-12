class Contact < ApplicationRecord

  has_one :user
  has_one :contact_event
  has_many :events, through: :contact_event
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