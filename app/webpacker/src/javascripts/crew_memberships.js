import Swal from 'sweetalert2'

$(document).on('turbolinks:load', function() {
  $("[data-behavior='delete-crew-membership']").click(function(e) {
    e.preventDefault()
    Swal.fire({
      title: 'Are you sure?',
      text: 'You will have to rejoin if you want access again...',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, remove it!',
      cancelButtonText: 'No, keep it'
    }).then((result) => {
      let parentRow = $(this).closest('tr')
      if (result.value) {
        $.ajax({
          url: $(this).attr("href"),
          dataType: "JSON",
          method: "DELETE",
          success: function() {
            parentRow.fadeOut(600)
            Swal.fire('Removed!', 'You are no longer a member of that crew! ☠️', 'success')
          },
          error: function() {
            Swal.fire('Unable to remove', 'Please reload the page and try again', 'warning')
          }
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire('', 'Your membership is safe... for now 😎', 'info')
      }
    })
  })
})
