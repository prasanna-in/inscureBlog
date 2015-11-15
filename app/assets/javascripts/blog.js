$(function () {
    $('#fileUpload').click(function () {
        $("#uploadFile").click();
    });

    $("#uploadFile").change(function () {
        var formData = new FormData();
        formData.append('file', this.files[0]);

        $("#uploadedFiles").append($("#fileUploadProgressTemplate").tmpl());
        $("#fileUploadError").addClass("hide");

        var deleteDocument = function (event) {
            var currentElement = $(this);
            $("#fileUploadError").addClass("hide");
            $.ajax({
                url: '/documents/' + currentElement.val(),
                type: 'DELETE',
                success: function (data) {
                    currentElement.parent('.uploaded_item').remove();
                },
                error: function () {
                    $("#fileUploadError").removeClass("hide").text("An error occurred!");
                }
            });
        };

        $.ajax({
            url: '/documents/upload',
            type: 'POST',
            xhr: function () {
                var xhr = $.ajaxSettings.xhr();
                if (xhr.upload) {
                    xhr.upload.addEventListener('progress', function (evt) {
                        var percent = (evt.loaded / evt.total) * 100;
                        $("#uploadedFiles").find(".progress-bar").width(percent + "%");
                    }, false);
                }
                return xhr;
            },
            success: function (data) {
                var templateData = _.merge(data, { file_name: formData.filename });
                $("#uploadedFiles").children().last().remove();
                $("#uploadedFiles").append($("#fileUploadItemTemplate").tmpl(templateData));
                $('button[name="fileUploadCloseButton"]').click(deleteDocument);
                //$("#uploadFile").closest("form").trigger("reset");
            },
            error: function () {
                $("#fileUploadError").removeClass("hide").text("An error occurred!");
                $("#uploadedFiles").children().last().remove();
                //$("#uploadFile").closest("form").trigger("reset");
            },
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        }, 'json');
    });
});