class Course < ApplicationRecord
    belongs_to :intructors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

    has_many :enrolled_students,
    through: :enrollment,
    source: :student

    belongs_to :prerequisites,
    primary_key: :id,
    foreign_key: :id,
    class_name: :Course

    has_many :prerequisites,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course
    
end
