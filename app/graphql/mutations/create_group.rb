class Mutations::CreateGroup < Mutations::BaseMutation
  argument :name, String, required: true

  field :group, Types::GroupType, null: true
  field :errors, [String], null: false

  def resolve(name:)
    group = Group.new(name: name)
    if group.save
      { group: group, errors: [] }
    else
      { group: nil, errors: group.errors.full_messages }
    end
  end
end
