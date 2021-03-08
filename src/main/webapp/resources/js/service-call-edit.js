var _token = $('meta[name="_csrf"]').attr('content');
var contextPath = $('meta[name="context_path"]').attr('content')
var files = [];

Dropzone.autoDiscover = false;

ClassicEditor.create(document.querySelector("#editor"), {
    ckfinder: {
        uploadUrl: `${contextPath}/editor-upload?_csrf=${_token}`,
    },
    toolbar: {
        items: [
            'heading',
            '|',
            'bold',
            'italic',
            'link',
            'bulletedList',
            'numberedList',
            '|',
            'alignment',
            'indent',
            'outdent',
            '|',
            'imageUpload',
            'blockQuote',
            'codeBlock',
            'insertTable',
            'mediaEmbed',
            'undo',
            'redo'
        ]
    },
    language: 'en',
    image: {
        toolbar: [
            'imageTextAlternative',
            'imageStyle:full',
            'imageStyle:side'
        ]
    },
    table: {
        contentToolbar: [
            'tableColumn',
            'tableRow',
            'mergeTableCells'
        ]
    },
})
    .then(editor => {
        window.editor = editor;
        var model = editor.model
        model.document.on('change:data', (event) => {
            const differ = event.source.differ
            if (differ.isEmpty) {
                return;
            }
            const changes = differ.getChanges({
                includeChangesInGraveyard: true
            })

            if (changes.length == 0) {
                return;
            }

            let hasNoImageRemoved = true;

            // check any image remove or not
            for (let i = 0; i < changes.length; i++){
                const change = changes[i]
                // if image remove exists
                if (change && change.type === 'remove' && change.name === 'image') {
                    hasNoImageRemoved = false
                    break
                }
            }

            // if not image remove stop execution
            if (hasNoImageRemoved) {
                return;
            }

            // get removed nodes
            const removedNodes = changes.filter(change => (change.type === 'insert' && change.name === 'image'))

            // removed images src
            const removedImagesSrc = [];
            // removed image nodes
            const removedImageNodes = []

            removedNodes.forEach(node => {
                const removedNode = node.position.nodeAfter
                removedImageNodes.push(removedNode)
                removedImagesSrc.push(removedNode.getAttribute('src'))
            })

            removedImagesSrc.forEach(imageUrl => {
                $.ajax({
                    type: 'POST',
                    url: `${imageUrl}?_csrf=${_token}`,
                });
            })
        })
    })
    .catch(error => {
        console.error(error.stack)
    })

ClassicEditor.create(document.querySelector("#editor2"), {
    ckfinder: {
        uploadUrl: `${contextPath}/editor-upload?_csrf=${_token}`,
    },
    toolbar: {
        items: [
            'heading',
            '|',
            'bold',
            'italic',
            'link',
            'bulletedList',
            'numberedList',
            '|',
            'alignment',
            'indent',
            'outdent',
            '|',
            'imageUpload',
            'blockQuote',
            'codeBlock',
            'insertTable',
            'mediaEmbed',
            'undo',
            'redo'
        ]
    },
    language: 'en',
    image: {
        toolbar: [
            'imageTextAlternative',
            'imageStyle:full',
            'imageStyle:side'
        ]
    },
    table: {
        contentToolbar: [
            'tableColumn',
            'tableRow',
            'mergeTableCells'
        ]
    },
})
    .then(editor2 => {
        window.editor2 = editor2;
        var model2 = editor2.model
        model2.document.on('change:data', (event) => {
            const differ = event.source.differ
            if (differ.isEmpty) {
                return;
            }
            const changes = differ.getChanges({
                includeChangesInGraveyard: true
            })

            if (changes.length == 0) {
                return;
            }

            let hasNoImageRemoved = true;

            // check any image remove or not
            for (let i = 0; i < changes.length; i++){
                const change = changes[i]
                // if image remove exists
                if (change && change.type === 'remove' && change.name === 'image') {
                    hasNoImageRemoved = false
                    break
                }
            }

            // if not image remove stop execution
            if (hasNoImageRemoved) {
                return;
            }

            // get removed nodes
            const removedNodes = changes.filter(change => (change.type === 'insert' && change.name === 'image'))

            // removed images src
            const removedImagesSrc = [];
            // removed image nodes
            const removedImageNodes = []

            removedNodes.forEach(node => {
                const removedNode = node.position.nodeAfter
                removedImageNodes.push(removedNode)
                removedImagesSrc.push(removedNode.getAttribute('src'))
            })

            removedImagesSrc.forEach(imageUrl => {
                $.ajax({
                    type: 'POST',
                    url: `${imageUrl}?_csrf=${_token}`,
                });
            })
        })
    })
    .catch(error => {
        console.error(error.stack)
    })

let portfolioDropzone = new Dropzone('#files-dropzone', {
    url: `${contextPath}/upload?_csrf=${_token}`,
    addRemoveLinks: true,
    timeout: 300000,
    maxFilesize: 1024,
    init: function () {
        myDropzone = this;
        this.on('success', function (file, response) {
            files.push(response.file.id)
        })
        $.ajax({
            url: `${window.location.href}/files`,
            success: function (response) {
                response.forEach(df => {
                    let mockFile = {
                        name: df.name,
                        id: df.id
                    };
                    files.push(df.id);
                    myDropzone.emit("addedfile", mockFile);
                    if (df.type.includes('image')) myDropzone.emit("thumbnail", mockFile, '/files/' + df.id);
                    myDropzone.emit("complete", mockFile);
                })
            }
        })
    },
    removedfile: function (file) {
        var fileId = file.id || JSON.parse(file.xhr.responseText)
        $.ajax({
            type: 'POST',
            url: `${window.location.href}/files/${fileId}?_csrf=${_token}`,
        });
        var index = files.findIndex(f => f == fileId)
        if (index >= 0) files.splice(index, 1);
        let _ref;
        return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
    },
})

$('#form').on('submit', function (e) {
    $('#files').html('');
    files.forEach(fileId => {
        var html = `<option selected>${fileId}</option>`
        $('#files').append(html)
    });
})