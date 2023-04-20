module Application
  module User
    module Factories
      class UserFactory
        def build_from_model(user_model:)
          Application::User::Domain::User.new(
            id: user_model.id,
            name: user_model.name,
            admin_flag: user_model.admin_flag
          )
        end
      end
    end
  end
end
