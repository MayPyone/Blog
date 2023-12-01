class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment
    can :create, Comment

    if user.is?('default') # additional permissions for logged in users (they can read their own posts)
      can %i[create destroy], Post, author: user
      can :destroy, Comment, user:
    else
      can :create, Post
      can :destroy, Post
      can :destroy, Comment
    end
  end
end
