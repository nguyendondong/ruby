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
        return true if user.present? && user.admin?  
        user.present? && user == post.user
    end

    def update?
        return true if user.present? && user.admin?  
        user.present? && user == post.user
    end
    private
    def post
        record
    end

end