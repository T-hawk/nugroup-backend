class Mutations::CreateComment < Mutations::BaseMutation
  argument :content, String, required: true
  argument :event_id, ID, required: true
  argument :user_id, ID, required: true
  argument :auth_token, String, required: true

  field :comment, Types::CommentType, null: true
  field :errors, [String], null: false

  def resolve(content:, event_id:, user_id:, auth_token:)
    begin
      event = Event.find(event_id)
      user = User.validate_user(id: user_id, auth_token: auth_token)
      raise "User not in group" if !user.groups.include? event.group
      comment = Comment.new(content: content, event_id: event_id, user_id: user_id)
      comment.save
      return {comment: comment, errors: []}
    rescue => error
      return {comment: nil, errors: [error]}
    end
  end
end
