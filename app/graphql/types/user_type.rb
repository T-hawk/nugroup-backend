module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :groups, [Types::GroupType], null: true

    def groups
      object.groups
    end
  end
end
