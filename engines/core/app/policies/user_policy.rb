class UserPolicy < Struct.new(:user, :object)
  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def update?
    user.admin? || (user.user? && has_user?(user, object))
  end

  private

  def has_user?(user, object)
    user.id == object.id
  end
end