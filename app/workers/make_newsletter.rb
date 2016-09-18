class MakeNewsletter
  
  include Sidekiq::Worker
  
  def perform
    newsletter = Newsletter.create
    Entry.where{(created_at >= 1.week.ago)}.each do |entry|
      entry.update_attribute(:newsletter_id, newsletter.id)
    end
  end
end