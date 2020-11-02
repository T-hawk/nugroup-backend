class Mutations::CreateEvent < Mutations::BaseMutation
  argument :title, String, required: true
  argument :content, String, required: true
  argument :group_id, ID, required: true
  argument :user_id, ID, required: true
  argument :auth_token, String, required: true

  field :event, Types::EventType, null: true
  field :errors, [String], null: false

  def resolve(title:, content:, group_id:, user_id:, auth_token:)
    begin
      user = User.validate_user(id: user_id, auth_token: auth_token)
      group = Group.find(group_id)
      raise "User is not in group" if !group.users.include? user
      event = Event.new(title: title, content: content, group_id: group.id)
      if event.save
        return {event: event, errors: []}
      end
    rescue => error
      return {event: nil, errors: [error]}
    end
    return {event: nil, errors: ["Could not create event"]}
  end
end
