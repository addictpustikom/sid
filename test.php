<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Stage Image Save</title>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Bootstrap Color Picker -->
        <link href="css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!-- Main content -->
        <section class="content">
            <h1>
                Upload Foto
            </h1>
            <div class='row'>
                <div class='col-md-12'>
                    <div class='box box-info'>
                        <div class='box-body pad'>
                            <form id="upload_form" enctype="multipart/form-data" method="post">
                                <img id="target" src="photo_default_square.png" width="230" height="230">
                                <div id="path"></div>
                                <div class="form-group">
                                    <input type="file" name="file1" id="file" multiple="multiple"><br>
                                    <input type="button" value="Upload File" onclick="uploadFile()">
                                    <progress id="progressBar" value="0" max="100" style="width:300px; display: none;"></progress>
                                    <h3 id="status"></h3>
                                    <p id="loaded_n_total"></p>
                                </div>
                            </form>
                        </div>
                    </div><!-- /.box -->
                </div><!-- /.col-->
            </div><!-- ./row -->
        </section><!-- /.content -->
        <script src="js/jquery-2.0.2.min.js" type="text/javascript"></script>
        <script>
                                        /* Script written by Adam Khoury @ DevelopPHP.com with some edit by Agung Surya Bangsa */
                                        $("#file").hide();
                                        $("#file").change(function() {
                                            var fileName = $(this).val();
                                            //var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '')
                                            var filename = $(this).val().replace(/C:\\fakepath\\/i, '')
                                            $("#path").html(filename);
                                        });
                                        $("#target").click(function() {
                                            $("#file").trigger("click");
                                        });
                                        function _(el) {
                                            return document.getElementById(el);
                                        }
                                        function uploadFile() {
                                            $("#progressBar").show();
                                            var formdata = new FormData();
                                            var file = _("file").files[0];
                                            //alert(file.name+" | "+file.size+" | "+file.type);
                                            formdata.append("file1", file);
                                            var ajax = new XMLHttpRequest();
                                            ajax.upload.addEventListener("progress", progressHandler, false);
                                            ajax.addEventListener("load", completeHandler, false);
                                            ajax.addEventListener("error", errorHandler, false);
                                            ajax.addEventListener("abort", abortHandler, false);
                                            ajax.open("POST", "proc_input_foto.php");
                                            ajax.send(formdata);
                                        }
                                        function progressHandler(event) {
                                            var loaded = event.loaded / 1024000;
                                            var total = event.total / 1024000;
                                            //_("loaded_n_total").innerHTML = "Uploaded " + loaded + " bytes of " + total;
                                            var percent = (event.loaded / event.total) * 100;
                                            _("progressBar").value = Math.round(percent);
                                            _("status").innerHTML = Math.round(percent) + "% uploaded... please wait";
                                        }
                                        function completeHandler(event) {
                                            alert(event.target.responseText);
                                            _("progressBar").value = 0;
                                            $("#progressBar").hide();
                                            $("#target").attr("src", "gambar/foto/" + event.target.responseText);
                                            //window.location.href = "index.php?loc=" + event.target.responseText;
                                        }
                                        function errorHandler(event) {
                                            _("status").innerHTML = "Upload Failed";
                                        }
                                        function abortHandler(event) {
                                            _("status").innerHTML = "Upload Aborted";
                                        }
        </script>
    </body>
</html>
