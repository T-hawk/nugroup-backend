module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :comments, [Types::CommentType], null: true

    def comments
      object.comments
    end
  end
end
