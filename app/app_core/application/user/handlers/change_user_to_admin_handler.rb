module Application
  module User
    module Handlers
      class ChangeUserToAdminHandler < EventManager::HandlerBase
        def notify(event:)
          user_id = event.event_object_id

          User::Jobs::ChangeUserToAdminJob.perform_later(user_id: user_id)

          use_case = Application::User::UseCases::ChangeUserToAdmin.build
          use_case.execute(user_id: user_id)
        end
      end
    end
  end
end
