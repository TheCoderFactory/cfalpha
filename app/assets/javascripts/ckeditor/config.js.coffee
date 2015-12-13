CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = '650'
  config.height = '100'
  config.toolbar_Pure = [
    { name: 'document',    items: [ 'Source','-','Templates' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic'] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList'] },
    { name: 'links',       items: [ 'Link','Unlink' ] },
    { name: 'styles',      items: [ 'Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'Image','Table','HorizontalRule','Smiley','SpecialChar' ] },
  ]
  config.toolbar = 'Pure'
  true