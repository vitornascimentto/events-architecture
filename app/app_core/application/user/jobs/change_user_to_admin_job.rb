require 'active_job'

module Application
  module User
    module Handlers
      class ChangeUserToAdminJob
        def perform(user_id:)
          use_case = Application::User::UseCases::ChangeUserToAdmin.build
          use_case.execute(user_id: user_id)
        end
      end
    end
  end
end
