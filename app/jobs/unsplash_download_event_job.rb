class UnsplashDownloadEventJob < ApplicationJob
  queue_as :default

  def perform(unsplash_id)
    photo = Unsplash::Photo.find(unsplash_id)

    photo.track_download if photo.present?
  rescue NoMethodError => _
    # internal gem error was preventing sidekiq job from completing
    nil
  end
end
