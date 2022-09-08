module CoursesHelper

  def enrollment_button(course)
    if current_user
      if current_user == course.user
        link_to course_path(course) do
          content_tag(:small, "You are the owner, View Analytics")
        end

      elsif course.enrollments.where(user_id: current_user.id).any?
        link_to course_path(course) do
          content_tag(:small, "Already purchased, continue learning!")
        end
      
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: "btn btn-sm btn-success"

      else
        link_to "Free", new_course_enrollment_path(course), class: "btn btn-sm btn-success"
      end
      #logic to buy a course
    else
      link_to "Check Price", course_path(course), class: "btn btn-sm btn-success"
    end
  end
end
