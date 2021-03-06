class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  scope :unread, -> { where(read_at: nil) }

  def mark_as_read!
    self.read_at = Time.now
    self.save!
  end

  def unread?
    self.read_at
  end
end
