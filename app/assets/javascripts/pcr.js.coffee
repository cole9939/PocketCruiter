# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  name = $('#template_description p:first-of-type').text()
  signature = $('#template_description p:last-of-type').text()
  
  $('#template_description p:first-of-type').replaceWith("<input id='change_name' type=text value='"+name+"'>")
  $('#template_description p:last-of-type').replaceWith("<input id='change_signature' type=text value='"+signature+"'>")
  
  $("#change_name").keyup ->
    change_body()
  
  $("#change_signature").keyup ->
    change_body()
    
  change_body = () ->
    template_body = $.trim($("#template_description").html())
    tmp = template_body.split("\n")
    template_body = template_body.replace(tmp[0], "<p>"+$('#change_name').val()+"</p>") 
    template_body = template_body.replace(tmp[tmp.length-1], "<p>"+$('#change_signature').val()+"</p></br></br>") 
    console.log template_body
    subject = (($('#mail_to').attr('href')).split("?body=")[1]).split("&subject=")[1]
    mail_to_link = ($('#mail_to').attr('href')).split("?body=")[0]+"?body="+encodeURIComponent(template_body)+"&subject="+subject
    $("#mail_to").attr("href", mail_to_link)
    

