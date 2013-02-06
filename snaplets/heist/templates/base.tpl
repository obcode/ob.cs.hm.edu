<!DOCTYPE html>
<html lang="de">
  <apply template="page-head"/>
  <body>

    <apply template="nav"/>
    <apply-content />
    <apply template="footer"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.8.3.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script>
    $(document).ready(function(){
      $("#totop").click(function () {
        $("body, html").animate({
          scrollTop: 0
        }, 300);
        return false;
      }); 
    });
   if ($.url.segment(0)) {
     $('.navbar li.'+$.url.segment(0)).addClass('active');
   } else {
     $('.navbar .home').addClass('active');
   }
    </script>

  </body>
</html>
