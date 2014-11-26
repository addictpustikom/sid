
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>jQuery UI Datepicker - Default functionality</title>
        <link href="css/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.0.2.min.js" type="text/javascript"></script>
        <script src="js/ui/jquery.ui.core.js" type="text/javascript"></script>
        <script src="js/ui/jquery.ui.widget.js" type="text/javascript"></script>
        <script src="js/ui/jquery.ui.datepicker.js" type="text/javascript"></script>
        <link href="css/demos.css" rel="stylesheet" type="text/css"/>
        <script>
            $(function() {
                $("#datepicker").datepicker();
            });
        </script>
    </head>
    <body>

        <p>Date: <input type="text" id="datepicker"></p>

        <div class="demo-description">
            <p>The datepicker is tied to a standard form input field.  Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay.  Choose a date, click elsewhere on the page (blur the input), or hit the Esc key to close. If a date is chosen, feedback is shown as the input's value.</p>
        </div>
    </body>
</html>
