module EventManager
  class PublisherFactory
    def self.build_with_subscribers
      publisher = Publisher.new

      publisher.configure_handlers do |config|
        config.subscribe(
          event_name: Application::User::Events::CreateAdmin::NAME,
          handlers: [
            EventManager::Handlers::SaveOnEventStoreHandler.new,
            Application::User::Handlers::ChangeUserToAdminHandler.new
          ]
        )

        config.subscribe(
          event_name: Application::User::Events::CreateUser::NAME,
          handlers: [EventManager::Handlers::SaveOnEventStoreHandler.new]
        )

        config.subscribe(
          event_name: Application::User::Events::CreateUserException::NAME,
          handlers: [EventManager::Handlers::SaveOnEventStoreHandler.new]
        )
      end

      publisher
    end
  end
end
