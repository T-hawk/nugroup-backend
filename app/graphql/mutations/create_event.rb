class Mutations::CreateEvent < Mutations::BaseMutation
  argument :title, String, required: true
  argument :content, String, required: true
  argument :group_id, ID, required: true

  field :event, Types::EventType, null: true
  field :errors, [String], null: false

  def resolve(title:, content:, group_id:)
    begin
      group = Group.find(group_id)
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
