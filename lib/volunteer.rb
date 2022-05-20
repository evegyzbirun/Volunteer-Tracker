#name
#id
#project id
require 'pry'

class Volunteer
  attr_reader :id , :project_id
  attr_accessor :name

  def initialize(attributes)
    @project_id = attributes(:project_id)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end


  def == (volunteer_to_compare)
    (self.name = volunteer_to_compare.name) && (self.project.id == volunteer_to_compare.project_id) && (self.id = volunteer_to_compare_id)
  end
  def self.all 
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fecth("id").volunteer_to_compare_id
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end
end