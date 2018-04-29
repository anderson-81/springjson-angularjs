<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout>
    <jsp:attribute name="body_area">
        <div class="container" ng-controller="PersonController">
            <div class="row">
                <div class="col-md-offset-2 col-md-8 col-md-offset-2">
                    <div class="form-group">
                        <h1>List</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <fieldset ng-disabled="status">
                    <div class="col-md-offset-2 col-md-8 col-md-offset-2">
                        <div class="form-group">
                            <label for="">Filter by name:</label>
                            <input type="text" class="form-control" ng-model="name">
                        </div>
                        <div class="form-group" id="div-table">
                            <table class="table" ng-show="persons.length > 0" data-page-length='5' ng-init="List()">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th>NAME</th>
                                        <th class="text-center">BIRTHDAY</th>
                                        <th class="text-center">SELECT</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr dir-paginate="person in persons|filter:name|itemsPerPage:5">
                                        <td class="text-center">{{person.id}}</td>
                                        <td>{{person.name}}</td>
                                        <td class="text-center">{{person.birthday}}</td>
                                        <td class="text-center"><a href="/person/edit/{{person.id}}" style="cursor:pointer;"><b>SELECT</b></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-group">
                            <dir-pagination-controls
                                max-size="5"
                                direction-links="true"
                                boundary-links="true" >
                            </dir-pagination-controls>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success pull-right col-md-2" ng-click="New()">Create</button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <link href="../../../resources/styles/index.css" rel="stylesheet" type="text/css"/>
        <script src="../../../resources/scripts/controllers/PersonController.js" type="text/javascript"></script>
    </jsp:attribute>
</t:_layout>