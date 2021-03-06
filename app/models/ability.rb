class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all # permissions for every user, even if not logged in
    cannot [:show], InstagramPost
    if user.present?
      can [:show, :update, :destroy], User, id: user.id
      if user.admin?
        can :manage, :all
      elsif user.author?
        can :manage, Recipe
        can :manage, InstagramPost
      elsif user.moderator?
        can :manage, Comment
      end
    end
  end
end
