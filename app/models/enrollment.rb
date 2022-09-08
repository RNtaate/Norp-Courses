class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user, :course, presence: true

  validates_uniqueness_of :user_id, scope: :course_id
  validates_uniqueness_of :course_id, scope: :user_id

  validate :can_not_subscribe_to_own_course

  protected
  def can_not_subscribe_to_own_course
    if new_record?
      if user_id == course.user_id
        errors.add(:base, "You can not enroll to your own course")
      end
    end
  end
end
