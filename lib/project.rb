#title
#name of volunteer
#id
# We make a project first, inside the project we can create a volunteer.
# Each volunteer has name and ID
# We need to have a page with all projects so user can view, add, update and delete projects.

class Project
  attr_reader :id, :volunteer_id
  attr_accessor :title

  def initialize(attributes)
    @volunteer_id = attributes(:volunteer_id)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
  
  def self.all 
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = procjet.fetch("id").to_i
      volunteer_id = procjet.fetch("volunteer_id").to_i
      projects.push(Project.new({:title => title, :id => id, volunteer_id => volunteer_id}))
    end
    projects 
  end
  
end
  