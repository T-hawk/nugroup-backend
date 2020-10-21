class Mutations::CreateComment < Mutations::BaseMutation
  argument :content, String, required: true
  argument :event_id, ID, required: true
  argument :user_id, ID, required: true

  field :comment, Types::CommentType, null: true
  field :errors, [String], null: false

  def resolve(content:, event_id:, user_id:)
    begin
      Event.find(event_id)
      User.find(user_id)
      comment = Comment.new(content: content, event_id: event_id, user_id: user_id)
      comment.save
      return {comment: comment, errors: []}
    rescue => error
      return {comment: nil, errors: [error]}
    end
  end
end
