class Todo < ApplicationRecord
  belongs_to :user

  validate :check_conflict, on: :update

  attr_writer :last_updated_at

  def last_updated_at
    @last_updated_at || updated_at.to_f
  end

  private
    def check_conflict
      errors.add(:conflict, "Already been changed while in edit.") if updated_at.to_f > last_updated_at.to_f
    end
end
