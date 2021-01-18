module Types
  class QueryType < Types::BaseObject
    field :event, Types::EventType, null: false do
      argument :event_id, ID, required: true
      argument :user_id, ID, required: true
      argument :auth_token, String, required: true
    end
    def event(event_id:, user_id:, auth_token:)
      user = User.validate_user(id: user_id, auth_token: auth_token)
      event = Event.find(event_id)
      if event.group.users.include? user
        event
      end
    end

    field :group, Types::GroupType, null: false do
      argument :group_id, ID, required: true
      argument :user_id, ID, required: true
      argument :auth_token, String, required: true
    end
    def group(group_id:, user_id:, auth_token:)
      group = Group.find(group_id)
      user = User.validate_user(id: user_id, auth_token: auth_token)
      if group.users.include? user
        group
      end
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
      argument :auth_token, String, required: true
    end
    def user(id:, auth_token:)
      User.validate_user(id: id, auth_token: auth_token)
    end
  end
end
