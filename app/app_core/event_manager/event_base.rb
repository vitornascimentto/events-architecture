module EventManager
  class EventBase
    def event_name
      raise NotImplementedError.new("Method name not implemented at #{self.class.name}")
    end

    def event_object_id
      raise NotImplementedError.new("Method event_object_id not implemented at #{self.class.name}")
    end

    def event_object_type
      raise NotImplementedError.new "Method event_object_type not implemented at #{self.class.name}"
    end

    def event_data
      raise NotImplementedError.new "Method event_data not implemented at #{self.class.name}"
    end

    def to_hash
      {
        event_name: event_name,
        event_data: event_data || {},
        object_id: event_object_id,
        object_type: event_object_type
      }
    end
  end
end
