$(function () {
  $(".grid").on("mouseover", function() {
    $(".grid-list").show();
  });
  $(".grid").on("mouseout", function() {
    $(".grid-list").hide();
  });
});
