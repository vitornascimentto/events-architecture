module Application
  module User
    module Events
      class CreateAdmin < EventManager::EventBase
        NAME = 'User.Events.CreateAdmin'.freeze

        def initialize(user:, author: nil)
          super()
          @user = user
          @author = author
        end

        def event_name
          NAME
        end

        def event_data
          {
            user: @user.to_hash,
            author: @author
          }
        end

        def event_object_id
          @user.id
        end

        def event_object_type
          @user.class.name
        end
      end
    end
  end
end
