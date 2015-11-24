class BookmarkPolicy < ApplicationPolicy
  def destroy?
    user.present? && (record.topic.user == user)
  end
end
