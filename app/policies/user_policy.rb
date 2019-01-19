class UserPolicy < ApplicationPolicy
def admin?
    true
end
def guest?
    true
end
   
end