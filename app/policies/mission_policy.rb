class MissionPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @mission = model
  end

  def new?
    @current_user.admin? || @current_user.user?
  end

  def create?
    @current_user.admin? || @current_user.user?
  end

  def index?
    true
  end

  def show?
    @current_user.admin? || @current_user.user?
  end

  def edit?
    @current_user.admin? || @current_user.id == @mission.user_id
  end

  def update?
    @current_user.admin? || @current_user.id == @mission.user_id
  end

  def destroy?
    @current_user.admin? || @current_user.id == @mission.user_id
  end
end
