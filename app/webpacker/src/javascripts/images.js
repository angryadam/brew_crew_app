$(document).on('click', ".unsplash-background-image", function() {
  unsplashSrc = $(this).attr('src')
  $('.modal .modal-content .image img').attr('src', unsplashSrc);
  $('.modal').fadeIn().css('display', 'flex')
});

$(document).on('click',   ".select-background-image-button", function() {
  let backgroundImage = $(this).siblings('.unsplash-image-container')
                               .find('.unsplash-background-image')
  $('.column').not($(this).parent('.column')).fadeOut()
  $(this).fadeOut()
  $("input[name='post[background_image_attributes][image_url]']").val(backgroundImage.attr('src'))
});

$(document).on('click', ".modal", function() {
  $('.modal').fadeOut()
});
