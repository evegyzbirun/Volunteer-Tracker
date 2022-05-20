#name
#id
#project id
require 'pry'
attr_reader :id
attr_accessor :name
class Volunteer

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end


  def == (volunteer_to_compare)
    (self.name = volunteer_to_compare.name) && (self.id = volunteer_to_compare.id)
  end

end