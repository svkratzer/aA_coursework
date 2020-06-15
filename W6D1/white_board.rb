# TWO TABLES
# Employees | Depaertments
# Employee belongs to a single department
# Given dept. name find all employees in that department

# department.name, employees.name

# SELECT employees.name
# FROM employees
# JOIN departments
# ON departments.id = employees.department_id
# WHERE departments.name = ?

#It would increase table size which increase lookup, insert, update, delete time. 


# == Schema Information
#
# Table name: users
#
#  id   :integer                not null, primary key
#  name :string                 not null
has_many :enrollments
    primary_key: :id
    foreign_key: :student_id 
    class_name: :Enrollment

has_many courses_taught:
    foreign: :professor_id
    class_name: :Course
    primray_key: :id
    optional: true

# Table name: enrollments
#
#  id   :integer                not null, primary key
#  course_id :integer           not null
#  student_id :integer          not null
belongs_to :course
    primary_key: :id
    foreign_key: :course_id 
    class_name: :Course

belongs_to user;
    primary_key: :id
    foreign_key: :student_id 
    class_name: :Users


# Table name: courses
#
#  id   :integer                not null, primary key
#  course_name :string          not null
#  professor_id :integer        not null
#  prereq_course_id :integer    not null

# belongs_to, has_many user, enrollment, course
has_many enrollments:
    primary_key: :id
    foreign_key: :course_id 
    class_name: :Enrollments

belongs_to course:
    primary_key: :id
    foreign_key: :prereq_course_id 
    class_name: :Course 
    optional: :true

belongs_to professor:
    primary_key: :id
    foreign_key: :professor_id
    class_name: :User 

# primary_key AND foreign_key

# == Schema Information
#
# Table name: physicians
#
#  id   :integer          not null, primary key
#  name :string           not null


# Table name: appointments
#
#  id   :integer           not null, primary key
#  physician_id :integer   not null
#  patient_id :integer     not null


# Table name: patients
#
#  id   :integer           not null, primary key
#  name :string            not null
#  primary_physician_id :integer

class Physician < ApplicationRecord

  has_many :appointments
    primary_key: :id,
    foreign_key: :physician_id,
    class_name: :Appointment

  has_many :patients
    primary_key: :id,
    foreign_key: :primary_physician_id,
    class_name: :Patient
  
  has_many :patient_primary_care_physicians,
    through: :patients,
    source: :primary_physcian 
  
  has_many :patient_appointments, 
    through: :appointments, 
    source: :patient

    has_many :general_patients,
    through: :appointments,
    source: :patient

  has_many :primary_patient_appointments,
    through: :primary_patients,
    source: :appointments

end

class Appointment < ApplicationRecord
  
  belongs_to :physician,
    primary_key: :id,
    foreign_key: :physician_id,
    class_name: :Physician

  belongs_to :patient,
    primary_key: :id,
    foreign_key: :patient_id,
    class_name: :Patient

end

class Patient < ApplicationRecord

  belongs_to :primary_physician,
    primary_key: :id,
    foreign_key: :primary_physician_id,
    class_name: :Physician

  has_many :appointments,
    primary_key: :id,
    foreign_key: :patient_id,
    class_name: :Appointment

end


#select, distinct, from, join, where, group by, having, limit/offset, order by

1. from/join 
3. where
4. group by
5. having
6. select
   distinct 
7. order by 
8. limit/offset 



# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

what years, physics prize awarded but no chemistry

Select 
    yr
FROM   
    nobels
where
    subject = 'Physics' 
and yr NOT IN (
    select 
        yr
    from 
        nobels 
    where 
        subject = 'Chemistry'
)

Using an ORM (Object Relational Model) allows you to interact with
database information in an OOP way. An ORM like ActiveRecord will translate rows
from your SQL tables into Ruby objects on fetch, and translates your Ruby
objects back to rows on save resulting in less overall database access code.

Whenever a model instance is _updated_ or _saved_ to the database.

# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

two sql queries
list of films where harrison ford has appeared but not in a star role
obtain a list in alpha order for actors who had at least 15 starring roles


SELECT movies.title
FROM movies
JOIN castings
ON castings.movie_id = movies.id 
JOIN actors
ON actors.id = castings.actor_id
WHERE actors.name = 'Harrison Ford' AND ord != 1

SELECT actors.name
FROM actors
JOIN castings
ON actors.id = castings.actor_id
WHERE ord = 1
GROUP BY actors.name
HAVING COUNT(ord) >= 15
ORDER BY actors.name

#migrations applies changes to the database

#Validations = models, database constraints = migrations



# == Schema Information
#
# Table name: user
#
#  id   :integer          not null, primary key
#  name :string           not null

has_many  :scores
    primray_key: :id
    foreign_key: :user_id 
    class_name: :User

has_many :games
    primray_key: :id
    foreign_key: :game_maker_id 
    class_name: :User
    optional: true
# Table name: score
#
#  id   :integer           not null, primary key
#  number :integer         not null
#  user_id :integer        not null
#  game_id :integer        not null

belongs_to :user
    primray_key: :id
    foreign_key: :user_id 
    class_name: :User

belongs_to :game
    primray_key: :id
    foreign_key: :game_id 
    class_name: :Game

# Table name: game
#
#  id   :integer           not null, primary key
#  name :string            not null
#  game_maker_id :integer  not null

has_many :scores
    primray_key: :id
    foreign_key: :game_id 
    class_name: :Score

belongs_to :gamer_maker
    primray_key: :id
    foreign_key: :game_maker_id 
    class_name: :User


    