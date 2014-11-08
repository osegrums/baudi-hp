/*
 * Image preview script
 * powered by jQuery (http://www.jquery.com)
 *
 * written by Alen Grakalic (http://cssglobe.com)
 *
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */

 initColorPreview = function(){

  xOffset = 50;
  yOffset = 35;

  $("a.bp-color-changer").hover(function(e){
    var offset = $(this).find('img').offset();
    var top = offset.top;
    var left = offset.left;
    $("body").append("<p id='preview'><img src='"+ this.href +"' />");

    $("#preview")
      .css("top",(top + yOffset) + "px")
      .css("left",(left + xOffset) + "px")
      .fadeIn("fast");
  },
  function(){
    this.title = this.t;
    $("#preview").remove();
  });

  // $("a.bp-color-changer").mousemove(function(e){
  //   $("#preview")
  //     .css("top",(e.pageY - yOffset) + "px")
  //     .css("left",(e.pageX + xOffset) + "px");
  // });
};
