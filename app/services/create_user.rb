class CreateUser
  def self.build
    new(
      user_model: User,
      publisher: EventManager::PublisherFactory.build_with_subscribers
    )
  end

  def initialize(user_model:, publisher:)
    @user_model = user_model
    @publisher = publisher
  end

  def create!(name:, admin:)
    # byebug
    user = @user_model.create!(name: name)
    publish_event(user: user, admin: admin)
  rescue StandardError => e
    publish_error_event(e.message)
  end

  private

  def publish_event(user:, admin:)
    event = get_event(user: user, admin: admin)
    @publisher.publish(event: event)
  end

  def publish_error_event(error)
    event = Application::User::Events::CreateUserException.new(error: error)
    # byebug
    @publisher.publish(event: event)
  end

  def get_event(user:, admin:)
    return Application::User::Events::CreateAdmin.new(user: user) if admin

    Application::User::Events::CreateUser.new(user: user)
  end
end
