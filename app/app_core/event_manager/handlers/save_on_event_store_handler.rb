module EventManager
  module Handlers
    class SaveOnEventStoreHandler < EventManager::HandlerBase
      def notify(event:)
        Event.create(
          event_name: event.event_name,
          event_data: event.event_data,
          event_object_id: event.event_object_id,
          event_object_type: event.event_object_type
        )
      end
    end
  end
end
