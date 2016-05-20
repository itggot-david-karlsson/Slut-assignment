class Priority
  include DataMapper::Resource

  property :user_id, Serial
  property :class, Serial
  property :milestone_id, Serial

end