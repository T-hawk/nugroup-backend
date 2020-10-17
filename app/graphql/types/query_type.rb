module Types
  class QueryType < Types::BaseObject
    field :event, Types::EventType, null: false do
      argument :id, ID, required: true
    end

    field :events, [Types::EventType], null: false

    def event(id:)
      Event.find(id)
    end

    def events
      Event.all
    end
  end
end
