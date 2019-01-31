class UserPolicy < ApplicationPolicy

def admin?
    true
end
def guest?
    true
end
def update?
    return true if user.present? && user.admin?  
end
def edit?
    return true if user.present? && user.admin?  
   
end
def show?
    true
end
def destroy?
    if user.present? && user.admin?
        return true
    end
end
    def userview?
    return true if user.present? && user.admin?  
    end
end