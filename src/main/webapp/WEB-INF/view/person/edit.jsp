<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout>
    <jsp:attribute name="body_area">
        <div class="container" ng-controller="PersonController" ng-show="frm" style="display:none;" id="divEdit">
            <div class="row">
                <form enctype="multipart/form-data" ng-submit="Edit()" ng-init="GetPersonByID()">
                    <fieldset ng-disabled="status">
                        <div class="col-md-offset-2 col-md-8 col-md-offset-2">
                            <div class="form-group">
                                <h1>Edit</h1>
                            </div>
                            <div class="form-group" ng-show="errors.length > 0">
                                <div id="errors" class="errors"><ul><li ng-repeat="error in errors">{{error}}</li></ul></div> 
                            </div>
                            <div class="form-group">
                                <input type="hidden" id="token" name="token" ng-model="token">
                            </div>
                            <div class="form-group">
                                <input type="hidden" id="id" name="id" ng-model="person.id">
                            </div>
                            <div class="form-group">
                                <label for="">Name</label>
                                <input type="text" class="form-control" id="name" name="name" ng-model="person.name">
                            </div>
                            <div class="form-group">
                                <label for="">E-mail</label>
                                <input type="text" id="email" name="email" class="form-control" ng-model="person.email">
                            </div>
                            <div class="form-group">
                                <label for="">Salary</label>
                                <input type="text" id="salary" name="salary" class="form-control" ng-model="person.salary"  money-mask>
                            </div>
                            <div class="form-group">
                                <label for="">Birthday</label>
                                <adm-dtp id="birthday" name="birthday" ng-model="person.birthday" mindate="'01/01/1900'" maxdate="'01/01/2001'"></adm-dtp>
                            </div>
                            <div class="form-group">
                                <label for="">Gender</label>
                                <select name="gender" id="gender" class="form-control" ng-model="person.gender">
                                    <option value="M">MALE</option>
                                    <option value="F">FEMALE</option>
                                </select><br>
                            </div>
                            <div class="form-group">
                                <label for="">Picture</label>
                                <img ng-src="{{avatar}}" class="img-edit pull-right">
                                <input type="file" ngf-select ng-model="picture" name="picture" ngf-accept="'image/*'" class="form-control" style="cursor:pointer;">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Edit" class="btn btn-warning pull-right col-md-2"> 
                                <a href="/person/index" class="btn btn-primary pull-right col-md-2">Return</a> 
                                <a href="#" ng-click="Delete()" class="btn btn-danger pull-right col-md-2">DELETE</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <link href="../../../resources/styles/form.css" rel="stylesheet" type="text/css"/>
        <script src="../../../resources/scripts/configs/configs.js" type="text/javascript"></script>
        <script src="../../../resources/scripts/controllers/PersonController.js" type="text/javascript"></script>
    </jsp:attribute>
</t:_layout>