module UserHelper
  def ability_icons(membership:)
    icons = ['<i class="fas fa-eye"></i>']
    icons << '<i class="fas fa-pen-nib"></i>' if membership.poster?
    icons << '<i class="fas fa-shield-alt"></i>' if membership.crew_admin?

    sanitize(icons.join(' '))
  end
end
