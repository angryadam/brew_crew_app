$(document).on('turbolinks:load', function() {
  $('.navbar-burger').click(function(_) {
    $('.navbar-menu').slideToggle(200);
  });
});
