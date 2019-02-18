class CommentPolicy < ApplicationPolicy
      def index?
      true
      end
      def new?
        true
      end
    
      def create?
        true
      end
    
      def destroy?
        return true if user.present? && user.admin?  
        user.present? && user == comment.user
      end
      def edit?
        user.present?
      end
      def update?
        user.present? || user.admin?
      end
      
    private
    def comment
        record
    end
end