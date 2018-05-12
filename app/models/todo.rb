class Todo < ApplicationRecord
  belongs_to :user

  attr_writer :last_updated_at

  validate :check_conflict, on: :update

  after_destroy_commit { TodoBroadcastJob.perform_later(act: 'delete', id: self.id) }
  after_create_commit { TodoBroadcastJob.perform_later(act: 'create', todo: self) }
  after_update_commit { TodoBroadcastJob.perform_later(act: 'update', todo: self) }

  def last_updated_at
    @last_updated_at || updated_at.to_f
  end

  private
    def check_conflict
      errors.add(:conflict, "Already been changed while in edit.") if updated_at.to_f > last_updated_at.to_f
    end
end
