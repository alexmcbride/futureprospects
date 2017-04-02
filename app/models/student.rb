class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :scottish_candidate_number, presence: true, uniqueness: true
  validates :national_insurance_number, presence: true, uniqueness: true

  before_create :before_create

  # Called before student is created, in order to generate username.
  def before_create
    # Keep generating username until we find one that's not being used
    while true
      username = generate_username self.first_name, self.family_name
      if username_free? username
        self.username = username
        break
      end
    end
  end

  # Generate username with initial, family name, then three digit random number
  def generate_username(first_name, family_name)
    initial = first_name[0].downcase
    family_name = family_name.downcase
    number = rand(100...999)
    initial + family_name + number.to_s
  end

  # Gets a boolean indicating if the username is inuse or not.
  def username_free?(username)
    student = Student.find_by_username username
    student.nil?
  end
end
