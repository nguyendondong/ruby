class CommentsPolicy < ApplicationPolicy
    def index?
      user.present? || user.admin?
      end
      def new?
        true
      end
    
      def create?
        true
      end
    
      def destroy?
        user.present? || user.admin?
      end
    
      def update?
        user.present? || user.admin?
      end
      def comment?
        true
    end
end