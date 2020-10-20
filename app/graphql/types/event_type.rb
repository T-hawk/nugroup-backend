module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :comments, [Types::CommentType], null: true
    field :users, [Types::UserType], null: true

    def comments
      object.comments
    end
    def users
      object.users
    end
  end
end
