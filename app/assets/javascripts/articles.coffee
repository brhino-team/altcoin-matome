$(document).on 'turbolinks:load', ->
  $('#article-tags-new, #article-tags-edit').tagit
    fieldName:   'tag_list'
    singleField: true
  $('#article-tags-new, #article-tags-edit').tagit()
  tag_string = $("#tag_hidden").val()
  try
    tag_list = tag_string.split(',')
    for tag in tag_list
      $('#article-tags').tagit 'createTag', tag
  catch error
