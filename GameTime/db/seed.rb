class Seeder

  def self.seed!
    self.users
    self.prioritys
    self.milestones
  end

  def self.users
    User.create(username: 'david', password: 'xxx')
    User.create(username: 'chilli', password: 'zzz')
  end

  def self.prioritys
    Priority.create(class: '1', user_id: 1)
    Priority.create(class: '2', user_id: 2)
  end

  def self.milestones
    Milestone.create(name: 'will', priority_id: 1)
    Milestone.create(name: 'shit', priority_id: 2)
    Milestone.create(name: 'fly', priority_id: 1)
  end

end