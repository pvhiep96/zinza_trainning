// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require jquery_nested_form

  function readURL(input, preview) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
       preview.attr('src', e.target.result);
      };
    }
    reader.readAsDataURL(input.files[0]);

  };

  $(document).on("change", "input[type=file]", function() {
    // debugger;
    readURL(this, $(this).nextAll(".preview").find("img"));
    
  });

  $(document).on ('click', 'form .remove_fields', function(){
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault()
  });
  $(document).on ('click', 'form .add_fields', function(){
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time));
  debugger;
  $(this).prev("fieldset").append("<div class='image-preview'><img style='width:150px;height:150px;'/></div>");
  event.preventDefault()
  });

  $(document).on("change", "#order_detail_quantity", function(){
    var a = $("#order_detail_quantity").val()
    var b = $("#price").html()
    $(".price-order").html( "$" + parseInt(a) * parseInt(b))
  });
  $('#micropost_picture').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }
  });
  