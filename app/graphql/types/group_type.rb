module Types
  class GroupType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :users, [Types::UserType], null: true
    field :events, [Types::EventType], null: true

    def users
      object.users
    end
    def events
      object.events
    end
  end
end
