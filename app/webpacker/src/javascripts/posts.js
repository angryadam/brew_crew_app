import Swal from 'sweetalert2'

$(document).on('turbolinks:load', function() {
  $("[data-behavior='go-live']").click(function(e) {
    e.preventDefault()
    let button = $(this)[0]
    let containerColumn = $(this).closest('.column')
    $.ajax({
      url: $(this).attr("href"),
      dataType: "JSON",
      method: "POST",
      success: function() {
        $(button).fadeOut('slow')
        containerColumn.fadeOut('slow', function() {
          $('.posts-container').first().prepend(containerColumn)
          containerColumn.fadeIn('slow')
        })
      }
    })
  })

  $("[data-behavior='delete']").click(function(e) {
    e.preventDefault()
    Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to recover this...',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, keep it'
    }).then((result) => {
      let parentContainer = $(this).closest('.column')
      let headerText = parentContainer.find('h4').text()
      if (result.value) {
        $.ajax({
          url: $(this).attr("href"),
          dataType: "JSON",
          method: "DELETE",
          success: function() {
            parentContainer.fadeOut(600)
            Swal.fire('Deleted!', `"${headerText}" is gone forever ☠️`, 'success')
          }
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire(`"${headerText}" is safe... for now 😎`, '', 'info')
      }
    })
  })

  $("[data-behavior='archive']").click(function(e) {
    e.preventDefault()
    Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to restore this...',
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Yes, archive it!',
      cancelButtonText: 'No, keep it'
    }).then((result) => {
      let parentContainer = $(this).closest('.column')
      let headerText = parentContainer.find('h4').text()
      let foobar = ''
      if (headerText.length) {
        foobar = `"${headerText}" is now hidden 🙈`
      } else {
        foobar = `This post is now hidden 🙈`
      }
      if (result.value) {
        $.ajax({
          url: $(this).attr("href"),
          dataType: "JSON",
          method: "POST",
          success: function() {
            parentContainer.fadeOut(600)
            Swal.fire('Archived!', foobar, 'success')
          }
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire(`"${headerText}" is visible... for now 👀`, '', 'info')
      }
    })
  })
});
