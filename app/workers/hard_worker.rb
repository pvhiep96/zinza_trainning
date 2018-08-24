class HardWorker
  include Sidekiq::Worker

  def perform
    Category.create user_id: User.first.id, name: 'Sidekiq'
  end
end
