import Swal from 'sweetalert2'

$(document).on('turbolinks:load', function() {
  $('.panel-heading').click(function(_) {
    $('#post-comments').slideToggle('fast')
  })

  $('#add-comment-button').click(function(_) {
    $(this).hide()
    $('#create-comment-form').slideDown('fast')
  })

  $("[data-behavior='delete-comment']").click(function(e) {
    e.preventDefault()
    Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to recover this...',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, keep it'
    }).then((result) => {
      let parentContainer = $(this).closest('.card')
      if (result.value) {
        $.ajax({
          url: $(this).attr("href"),
          dataType: "JSON",
          method: "DELETE",
          success: function() {
            parentContainer.fadeOut(600)
            Swal.fire('Deleted!', 'Your comment is gone forever ☠️', 'success')
          },
          error: function() {
            Swal.fire("Unable to delete \n your comment \n reload the page \n and try again",
                '', 'warning')
          }
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire("Your comment is safe... for now 😎", '', 'info')
      }
    })
  })
})
