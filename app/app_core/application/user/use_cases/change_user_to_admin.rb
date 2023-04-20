module Application
  module User
    module UseCases
      class ChangeUserToAdmin
        def self.build
          new(all_users: Application::User::Repositories::AllUsers.build)
        end

        def initialize(all_users:)
          @all_users = all_users
        end

        def execute(user_id:)
          user_domain = @all_users.get_by_id(user_id: user_id)
          user_domain.change_to_admin

          @all_users.save!(user_domain: user_domain)
        end
      end
    end
  end
end
