module EventManager
  class Publisher
    def initialize
      @subscribers = {}
    end

    def configure_handlers(&block)
      instance_eval(&block)
    end

    def subscribe(event_name:, handlers:)
      @subscribers[event_name] = handlers
    end

    def publish(event:)
      event_name = event.event_name

      return unless event?(event_name: event_name)

      handlers = @subscribers[event_name] || []
      handlers.each do |handler|
        handler.send_notification(event: event)
      end
    end

    def publish_all(events:)
      events.each { |event| publish(event) }
    end

    private

    def event?(event_name:)
      @subscribers.keys.include?(event_name)
    end
  end
end
