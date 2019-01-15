class PostPolicy < ApplicationPolicy
    def index?
        true
    end
    def new?
        true
    end
    def show?
        true
    end
    def edit?
        true
    end
    def destroy?
        user.present? && user.admin?
    end
    def create?
        user.present? && user.admin?
    end
    def update?
        return  true if  user.present? && user.admin?
        user.present? && user == record.user
    end
    private
    def post
        record
    end

end