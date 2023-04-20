module Application
  module User
    module Domain
      class User
        attr_reader :id, :name, :admin_flag

        def initialize(id:, name:, admin_flag:)
          @id = id
          @name = name
          @admin_flag = admin_flag
        end

        def change_to_admin
          @admin_flag = true
        end

        def to_hash
          {
            id: @id,
            name: @name,
            admin_flag: @admin_flag
          }
        end
      end
    end
  end
end
