#name
#id
#project id


class Volunteer
  attr_reader :id, :project_id
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
      id = volunteer.fetch("id").volunteer_to_compare_id
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end
  def self.clear
    DB.exec("DELETE FROM volunteers *;")
  end
  def self.find(id)
    volunteers = DB.exec("SELECT * FROM volunteers id = #{id};").first
    name = volunteers.fetch("name")
    project_id = volunteers.fetch("procjet_id")
    id = volunteers.fetch("id").to_i
    Volunteer.new({:name => name, :procjet_id => procjet_id, :id => id})
  end
  def save 
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{name}','#{procjet_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
  def delete
    DB.exec("DELETE FROM projects_volunteers WHERE volunteer_id = #{@id};")
    DB.exec("DELETE FROM volunteers WHERE id = #{@id}")
  end


  def update(name) #(attributes)
    #@name = name
    #@project_id = procjet_id
    #DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = '#{@procjet_id}' WHERE id = '#{@id}';")
   
      @title = title
      DB.exec("UPDATE volunteers SET name = '#{name}' WHERE id = #{id};")
    end
  end

  def procjets
  #def self.find_by_volunteer
end