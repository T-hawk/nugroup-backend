class Mutations::JoinGroup < Mutations::BaseMutation
  argument :share_token, String, required: true
  argument :user_id, Integer, required: true
  argument :auth_token, String, required: true

  field :group, Types::GroupType, null: true
  field :errors, [String], null: false

  def resolve(share_token:, user_id:, auth_token:)
    begin
      user = User.find_by(id: user_id, auth_token: auth_token)
      raise "Invalid user credentials" if !user
      group = Group.find_by(share_token: share_token)
      raise "User already in group" if group.users.include? user
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
