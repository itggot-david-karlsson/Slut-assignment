class Milestone
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text

  belongs_to :priority

end