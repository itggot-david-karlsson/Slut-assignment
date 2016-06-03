class Seeder

  def self.seed!
    self.users
    self.prioritys
    self.milestones
  end

  def self.users
    User.create(username: 'grill', password: 'korv')
    User.create(username: 'chilli', password: 'zzz')
    User.create(username: 'daniel', password: '123')
    User.create(username: 'tester', password: '111')
    User.create(username: 'david', password: 'xxx')
  end

  def self.prioritys
    Priority.create(klass: '1', user_id: 1, milestone_id: 1)
    Priority.create(klass: '2', user_id: 1, milestone_id: 2)
    Priority.create(klass: '2', user_id: 1, milestone_id: 3)
    Priority.create(klass: '3', user_id: 1, milestone_id: 4)
    Priority.create(klass: '4', user_id: 1, milestone_id: 5)
    Priority.create(klass: '1', user_id: 2, milestone_id: 6)
    Priority.create(klass: '2', user_id: 2, milestone_id: 1)
    Priority.create(klass: '3', user_id: 2, milestone_id: 2)
    Priority.create(klass: '4', user_id: 2, milestone_id: 3)
    Priority.create(klass: '1', user_id: 3, milestone_id: 4)
    Priority.create(klass: '1', user_id: 3, milestone_id: 5)
    Priority.create(klass: '2', user_id: 3, milestone_id: 6)
    Priority.create(klass: '1', user_id: 4, milestone_id: 1)
    Priority.create(klass: '1', user_id: 5, milestone_id: 2)
    Priority.create(klass: '3', user_id: 5, milestone_id: 3)
    Priority.create(klass: '4', user_id: 5, milestone_id: 4)
  end

  def self.milestones
    Milestone.create(name: 'will', description: 'Kill will')
    Milestone.create(name: 'shit', description: 'Shit tastes great')
    Milestone.create(name: 'fly', description: 'Flies are annoying')
    Milestone.create(name: 'that', description: 'that or this?')
    Milestone.create(name: 'this', description: 'this or that?')
    Milestone.create(name: 'KKK', description: 'Ku Klux Klan')
  end

end