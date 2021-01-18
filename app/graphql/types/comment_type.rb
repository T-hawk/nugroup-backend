module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :user, Types::UserType, null: false
  end
end
