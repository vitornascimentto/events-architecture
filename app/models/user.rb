class User < ActiveRecord::Base
  validates :name, presence: true
  # validates :admin_flag, presence: true

  def map_from_domain(user_domain:)
    self.name = user_domain.name
    self.admin_flag = user_domain.admin_flag
  end

  def to_hash
    {
      id: id,
      name: name,
      admin_flag: admin_flag
    }
  end
end
