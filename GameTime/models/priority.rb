class Priority
  include DataMapper::Resource

  property :id, Serial
  property :class, String

  belongs_to :user
  has n, :milestones

end