class UserPolicy < ApplicationPolicy
def admin?
    true
end
def guest?
    true
end
def update?
    return true if user.present? && user.admin?  
    user.present? && user == current_user?
end