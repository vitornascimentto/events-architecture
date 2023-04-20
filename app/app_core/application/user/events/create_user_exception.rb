module Application
  module User
    module Events
      class CreateUserException < EventManager::EventBase
        NAME = 'User.Events.CreateUserException'.freeze

        def initialize(error:, author: nil)
          super()
          @error = error
          @author = author
        end

        def event_name
          NAME
        end

        def event_data
          {
            error: @error,
            author: @author
          }
        end

        def event_object_id
          1
        end

        def event_object_type
          'type'
        end
      end
    end
  end
end
