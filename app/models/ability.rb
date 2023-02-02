# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?
    can :manage, Post, author: user

    return unless user.admin?
    can :manage, :all
  end
end
