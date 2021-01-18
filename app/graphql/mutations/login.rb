class Mutations::Login < Mutations::BaseMutation
  argument :username, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :auth_token, String, null: true
  field :errors, [String], null: false

  def resolve(username:, password:)
    user = User.find_by(username: username)
    if user and user.authenticate(password)
      { user: user, auth_token: user.auth_token, errors: [] }
    else
      { user: nil, auth_token: nil, errors: user.errors.full_messages }
    end
  end
end
