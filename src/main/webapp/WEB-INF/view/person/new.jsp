<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout>
    <jsp:attribute name="body_area">
            <div class="container" ng-controller="PersonController" style="display:none;" id="divCreate">
                <div class="row">
                    <form enctype="multipart/form-data" ng-submit="Create()" ng-init="Reset()" method="POST">
                        <fieldset ng-disabled="status">
                            <div class="col-md-offset-2 col-md-8 col-md-offset-2">
                                <div class="form-group">
                                    <h1>CREATE</h1>
                                </div>
                                <div class="form-group">
                                    <div id="errors" class="errors" ng-show="errors.length > 0"><ul><li ng-repeat="error in errors">{{error}}</li></ul></div> 
                                </div>
                                <div class="form-group">
                                    <input type="hidden" id="token" name="token" ng-model="token">
                                </div>
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" ng-model="person.name" value="">
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
                                        <option ng-repeat="gender in genders" value="{{gender.value}}">{{gender.name}}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Picture</label>
                                    <input type="file" ngf-select ng-model="picture" name="picture" ngf-accept="'image/*'" class="form-control" style="cursor:pointer;">
                                </div>
                                <div class="form-group" ng-disabled="">
                                    <button type="submit" class="btn btn-success pull-right col-md-2">Create</button>
                                    <a href="/person/index" class="btn btn-primary pull-right col-md-2">Return</a> 
                                    <button ng-click="New()" type="button" class="btn btn-secondary pull-right col-md-2">Reset</button>
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