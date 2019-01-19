class PostPolicy < ApplicationPolicy
    def index?
        true
    end
    def new?
        user.present?
    end
    def show?
        true
    end
    def destroy?
        if user.present? && user.admin?
            return true
        end
    end
    def create?
        user.present?
    end

    def edit?
        if user.present? && (user.admin? || user == post.user)
            return true
        end
    end

    def update?
        if user.present? && (user.admin? || user == post.user)
            return true
        end
    end
    private
    def post
        record
    end

end