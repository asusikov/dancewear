CKEDITOR.editorConfig = (config ) ->
    config.toolbar_mini = [
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink'],
        ['Image','Table','HorizontalRule'],
        ['Styles','Format','Font','FontSize'],
        ['TextColor','BGColor']
    ]
