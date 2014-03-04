 $(document).ready(function(){
  
  $("form").submit(function(e){
    e.preventDefault();
    $("#errors").empty();
    var url = $('form').attr('action');
    var method = $('form').find("input[name='_method']").val();
    data = convertFormToJSON($('form'));
    $.ajax({
          type: method,
          url: url,
          data: data,
          success: checkError,
          dataType: 'json'
    });
  });
});

var convertFormToJSON = function (form){
    var array = jQuery(form).serializeArray();
    var json = {};
    
    jQuery.each(array, function() {
        json[this.name] = this.value || '';
    });
    
    return json;
}

var checkError = function (response) {
  if (response.errors) {
    $.each(response.errors,function(index,value){
      $("#errors").append("<li>"+value+"</li>");
    });
  }
  else{
    
  }
}