module Application
  module User
    module Repositories
      class AllUsers
        def self.build
          new(
            user_model: ::User,
            user_factory: Application::User::Factories::UserFactory.new,
          )
        end

        def initialize(user_model:, user_factory:)
          @user_model = user_model
          @user_factory = user_factory
        end

        def get_by_id(user_id:)
          user_model = @user_model.find(user_id)
          @user_factory.build_from_model(user_model: user_model)
        end

        def save!(user_domain:)
          user_model = @user_model.find(user_domain.id)

          # user_model.name = user_domain.name
          # user_model.admin_flag = user_domain.admin_flag

          user_model.map_from_domain(user_domain: user_domain)
          user_model.save!
        end
      end
    end
  end
end
