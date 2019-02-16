$(document).ready(function(){
    $(document).on('hover','.img-list', function(){
        var imgsrc = $(this).attr('src')
      $("img-show").attr("src", "imgsrc");
    });
  });

  <script type="text/javascript">
    $(document).ready(function(){
        $('document').on('click','img-',function(){              
                var imgsrc=$(this).attr('src');             
                $("html").append("<div id='image_popup'><img src='"+imgsrc+"'></div>");
            })
        });

  </script>