class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true

  field :user, Types::UserType, null: true
  field :auth_token, String, null: true
  field :errors, [String], null: false

  def resolve(username:, password:, password_confirmation:)
    user = User.new(username: username, password: password, password_confirmation: password_confirmation)
    if user.save
      { user: user, auth_token: user.auth_token, errors: [] }
    else
      { user: nil, auth_token: nil, errors: user.errors.full_messages }
    end
  end
end
