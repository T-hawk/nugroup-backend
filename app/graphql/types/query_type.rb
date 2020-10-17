module Types
  class QueryType < Types::BaseObject
    field :event, Types::EventType, null: false do
      argument :id, ID, required: true
    end
    def event(id:)
      Event.find(id)
    end

    field :events, [Types::EventType], null: false
    def events
      Event.all
    end

    field :group, Types::GroupType, null: false do
      argument, :id, ID, required: true
    end
    def group(id:)
      Group.find(id)
    end
  end
end
