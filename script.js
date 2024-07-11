$(document).ready(function () {
  $("#btn-add").click(function () {
    $("add").css("display", "inline");
  });

  $("#btn-del").click(function () {
    $("del").css("display", "inline");
  });

  $("#btn-gap").click(function () {
    $("gap").css("display", "inline");
  });

  $("#btn-persname").click(function () {
    $("persname").css("background-color", "#2196f3");
  });

  $("#btn-abbr").click(function () {
    $("abbr").css("background-color", "#90d464");
  });

  $("#btn-expan").click(function () {
    $("expan").css("display", "inline");
  });

  $("#btn-hide").click(function () {
    $("add, del, gap, expan").hide();
    $("persname, abbr").css("background-color" , "white");
  });
});
