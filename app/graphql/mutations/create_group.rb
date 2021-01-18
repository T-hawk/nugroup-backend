class Mutations::CreateGroup < Mutations::BaseMutation
  argument :name, String, required: true
  argument :user_id, ID, required: true
  argument :auth_token, String, required: true

  field :group, Types::GroupType, null: true
  field :errors, [String], null: false

  def resolve(name:, user_id:, auth_token:)
    user = User.validate_user(id: user_id, auth_token: auth_token)
    group = Group.new(name: name)
    group.users << user
    if group.save
      { group: group, errors: [] }
    else
      { group: nil, errors: group.errors.full_messages }
    end
  end
end
