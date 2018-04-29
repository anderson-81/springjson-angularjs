<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout>
    <jsp:attribute name="body_area">
        <div class="container margin-10" ng-controller="LoginController">
            <div class="row">
                <div class="col-md-offset-3 col-md-6 col-md-offset-3">
                    <div class="form-group">
                        <div id="errors" class="errors" ng-show="errors.length > 0"><ul><li ng-repeat="error in errors">{{error}}</li></ul></div> 
                    </div>
                </div>
            </div>
            <div class="row">
                <form ng-submit="Login()" ng-init="Reset()" method="POST">
                    <fieldset ng-disabled="status">
                        <div class="col-md-offset-4 col-md-4 col-md-offset-4">
                            <div class="form-group">
                                <input type="hidden" id="token" name="token" ng-model="token"><br>
                            </div>
                            <div class="form-group">
                                <label for="">Username</label>
                                <input type="text" id="username" name="username" ng-model="username" class="form-control"><br>
                            </div>
                            <div class="form-group">
                                <label for="">Password</label>
                                <input type="password" id="password" name="password" ng-model="password" class="form-control"><br>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success col-md-3 pull-right">Login</button>
                                <button type="button" class="btn btn-default col-md-3 pull-right" ng-click="Cancel()">Cancel</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <link href="../../../resources/styles/form.css" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>