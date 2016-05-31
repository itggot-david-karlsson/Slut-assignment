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
    Priority.create(klass: '1', user_id: 1, milestone_id: 1)
    Priority.create(klass: '2', user_id: 2, milestone_id: 1)
    Priority.create(klass: '2', user_id: 2, milestone_id: 2)
    Priority.create(klass: '1', user_id: 2, milestone_id: 1)
  end

  def self.milestones
    Milestone.create(name: 'will', description: 'ajdasjdas')
    Milestone.create(name: 'shit', description: 'sadnosvdm')
    Milestone.create(name: 'fly', description: 'preadsaf')
  end

end