module EventManager
  class HandlerBase
    def notify(event:)
      raise NotImplementedError.new("Method notify not implemented at #{self.class.name}")
    end

    def send_notification(event:)
      notify(event: event)
    end
  end
end
