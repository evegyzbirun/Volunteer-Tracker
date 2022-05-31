#title
#name of volunteer
#id
# We make a project first, inside the project we can create a volunteer.
# Each volunteer has name and ID
# We need to have a page with all projects so user can view, add, update and delete projects.

class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
  
  def self.all 
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = procjet.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects 
  end

  def ==(project_to_compare)
    (self.title == project_to_compare.title) && (self.id = project_to_compare.id)
  end

  def save 
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    projects = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = projects.fetch("title")
    id = projects.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end

  



end
  