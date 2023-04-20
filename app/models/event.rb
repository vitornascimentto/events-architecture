class Event < ActiveRecord::Base
  validates :event_name, presence: true
  validates :event_data, presence: true
  validates :event_object_id, presence: true
  validates :event_object_type, presence: true

  def to_hash
    {
      name: self.event_name,
      event_data: self.event_data,
      created_at: self.created_at
    }
  end
end
