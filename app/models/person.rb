class Person < ActiveRecord::Base
  validate :title_or_first_name_are_required

  def title_or_first_name_are_required
    if last_name.blank?
      errors.add(:last_name, "is required")
    elsif title.blank? && first_name.blank? && last_name.present?
      if title.blank? && first_name.blank?
        errors.add(:title, "is required")
        errors.add(:first_name, "is required")
      elsif title.blank?
        errors.add(:title, "is required")
      elsif first_name.blank?
        errors.add(:first_name, "is required")
      end
    end
  end
end