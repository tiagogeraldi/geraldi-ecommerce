$(document).ready(function () {
  $('input.cart-quantity').on('blur', function() {
    $(this).closest('form').submit();
  });
});