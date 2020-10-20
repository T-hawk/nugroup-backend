class Mutations::JoinGroup < Mutations::BaseMutation
  argument :group_id, Integer, required: true
  argument :user_id, Integer, required: true

  field :group, Types::GroupType, null: true
  field :errors, [String], null: false

  def resolve(group_id:, user_id:)
    begin
      group = Group.find(group_id)
      user = User.find(user_id)
      if group.users |= [user]
        { group: group, errors: [] }
      else
        { group: nil, errors: group.errors.full_messages }
      end
    rescue => error
      { group: nil, errors: [error.message] }
    end
  end
end
