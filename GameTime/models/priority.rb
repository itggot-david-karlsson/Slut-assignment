class Priority
  include DataMapper::Resource

  property :id, Serial
  property :klass, String, required: true

  belongs_to :user

end