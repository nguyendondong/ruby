class PostPolicy < ApplicationPolicy
    def index?
        true
    end
    def new?
        user.present?&&user.admin?
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
        user.present?&& user.admin?
    end

    def edit?
        return true if user.present? && user.admin?  
       
    end

    def update?
        return true if user.present? && user.admin?  
        user.present? && user == post.user
    end
    def comment?
        true
    end
    

    private
    def post
        record
    end

end