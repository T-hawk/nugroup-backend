module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :groups, [Types::GroupType], null: true
    field :comments, [Types::CommentType], null: true

    field :auth_token, String, null: true

    def groups
      object.groups
    end
    def comments
      object.comments
    end
  end
end
