module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_group, mutation: Mutations::CreateGroup
    field :join_group, mutation: Mutations::JoinGroup
  end
end
