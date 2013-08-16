jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $.fn.twitter_bootstrap_confirmbox.defaults = 
  	proceed: "Да"
  	cancel: "Нет"
  	proceed_class: "btn proceed btn-danger"