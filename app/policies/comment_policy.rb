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
        true
      end
      def edit?
        user.present?
      end
      def update?
        user.present? || user.admin?
      end
      def comment?
        true
    end
end