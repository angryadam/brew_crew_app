class NotifyCrewOfLivePostJob < ApplicationJob
  queue_as :default

  def perform(post_id:, crew_id:)
    crew = Crew.find_by_id(crew_id)

    crew.members.each { |mbr| NotificationsMailer.new_live_post(post_id:   post_id,
                                                                member_id: mbr.id,
                                                                crew_id: crew_id)
                                                 .deliver_later }
  end
end
