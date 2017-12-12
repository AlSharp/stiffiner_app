$(document).on('turbolinks:load', function(){
    
    // add ibeams into right listbox by clicking arrow button "right"
   $('#btn-arrowRight').click(function(){
       var arr_val = [];
       var arr_text = [];
       $('#listbox1 :selected').each(function(i, selected){
           arr_val[i] = $(selected).val();
           arr_text[i] = $(selected).text();
       });
       var option = '';
       for (i=0;i<arr_text.length;i++){
           option += '<option value="'+ arr_val[i] + '">' + arr_text[i] + '</option>';
       }
       
       console.log(arr_val);
       console.log(arr_text);
       $('#listbox1 option:selected').remove();
       $('#listbox2').append(option);
       console.log($('#listbox1 option').length);
   });
   
   // remove ibeams from right listbox by clicking arrow button "left"
   $('#btn-arrowLeft').click(function() {
      var arr_val = [];
      var arr_text = [];
      $('#listbox2 :selected').each(function(i, selected){
           arr_val[i] = $(selected).val();
           arr_text[i] = $(selected).text();
      });
      console.log(arr_val);
      console.log(arr_text);
      var option = '';
      for (i=0;i < arr_text.length;i++){
           option = '<option value="'+ arr_val[i] + '">' + arr_text[i] + '</option>';
           if ($('#listbox1 option').length == 0) {
               $('#listbox1').append($(option));
           } else if (arr_val[i] < $('#listbox1 option').length) {
               var j = 0;
               do {
                   j++;
                   console.log("<=")
               }
               while ($('#listbox1 option[value="' + (parseInt(arr_val[i])+j).toString() + '"]').val() == null);
               $(option).insertBefore('#listbox1 option[value="' + (parseInt(arr_val[i])+j).toString() + '"]');
           } else {
               var j = 0;
               do {
                   j--;
                   console.log(">")
               }
               while ($('#listbox1 option[value="' + (parseInt(arr_val[i])+j).toString() + '"]').val() == null);
               $(option).insertAfter('#listbox1 option[value="' + (parseInt(arr_val[i])+j).toString() + '"]');
           }
           console.log($('#listbox1 option[value="' + (parseInt(arr_val[i])+j).toString() + '"]').val());
      }
      console.log($('#listbox1 option').length);
      $('#listbox2 option:selected').remove();
   });
   
   // create stiffener
   $('#btn-create-stiffener').click(function() {
      $('#listbox2 option').prop('selected', true);
      $('#form-create-stiffener').submit();
   });
   
   //delete stiffener
   $('.btn-destroy *').click(function() {
      $('tr#row-' + $(this).attr('id')).remove(); 
      $.ajax({
         type: 'DELETE',
         url: '/stiffeners/' + $(this).attr('id')
      });
      console.log($(this).attr('id'));
      
      alert('Row deleted');
   });
   
   console.log($('.form-main-part').height());
   
   // adjusting heights of the forms
    $('#form-main-part-new-stiffener').height($('.form-new-stiffener').height() - $('.form-header').height() - 26);
    $('#list-of-stiffeners-main-part').height($('.list-of-stiffeners').height() - $('.form-header').height() - 26);
    $('#table-of-stiffeners > tbody').height($('#list-of-stiffeners-main-part').height() - $('tr.head-row').height() - $('#btn-new').outerHeight() - 20 - 3);
   //draggable form create new stiffener
    $('.form-new-stiffener').draggable({ handle: ".form-header"});
   
});