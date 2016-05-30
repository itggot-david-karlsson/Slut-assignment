class Milestone
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true

  belongs_to :priority

end