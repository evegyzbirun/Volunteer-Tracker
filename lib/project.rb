#title
#name of volunteer
#id
# We make a project first, inside the project we can create a volunteer.
# Each volunteer has name and ID
# We need to have a page with all projects so user can view, add, update and delete projects.
require 'pry'
class Project
  attr_reader :id, :volunteer_id
  attr_accessor :title

  def initialize(attributes)
    @volunteer_id = attributes(:volunteer_id)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
end
  