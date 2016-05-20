class Milestone
  include DataMapper::Resource

  property :milestone_id, Serial
  property :name, String, required: true
  property :description, Text

end