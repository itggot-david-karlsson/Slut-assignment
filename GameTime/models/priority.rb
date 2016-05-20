class Priority
  include DataMapper::Resource

  property :id, Serial
  property :class, Serial

  belongs_to :user
  has n, :milestones

end