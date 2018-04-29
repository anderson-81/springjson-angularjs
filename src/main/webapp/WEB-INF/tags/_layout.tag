<!DOCTYPE html>
<%@attribute name="body_area" fragment="true" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../../resources/vendor/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../../resources/vendor/js/angular.min.js" type="text/javascript"></script>
        <script src="../../../resources/vendor/js/rw-money-mask.min.js" type="text/javascript"></script>
        <script src="../../../resources/vendor/js/ADM-dateTimePicker.min.js" type="text/javascript"></script>
        <link href="../../../resources/vendor/css/ADM-dateTimePicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../../resources/vendor/js/ng-file-upload-shim.js" type="text/javascript"></script>
        <script src="../../../resources/vendor/js/ng-file-upload.js" type="text/javascript"></script>
        <script src="../../../resources/vendor/js/dirPagination.js" type="text/javascript"></script>
        <script src="../../resources/scripts/app.js" type="text/javascript"></script>
        <script src="../../resources/scripts/services/services.js" type="text/javascript"></script>
        <script src="../../resources/scripts/controllers/HomeController.js" type="text/javascript"></script>
        <script src="../../resources/scripts/controllers/LoginController.js" type="text/javascript"></script>
    </head>
    <body ng-app="SpringJson">
        <nav class="navbar navbar-inverse" ng-controller="HomeController">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">SpringJson</a>
                </div>
                <ul class="nav navbar-nav" id="navleft">
                    <li><a href="/index">Home</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right" id="navright">
                    <li><a href="/person/index" ng-show="logged">Person</a></li>
                    <li><a href="#" ng-show="logged"><span ng-controller="LoginController" ng-click="Logout()">Logout</span></a></li>
                    <li><a href="/login" ng-show="!logged">Login</a></li>
                </ul>
            </div>
        </nav>
        <div id="alert"></div>
        <jsp:invoke fragment="body_area"/>
    </body>
</html>