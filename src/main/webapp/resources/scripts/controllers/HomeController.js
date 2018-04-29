app.controller("HomeController", function ($scope, AppService) {
    AppService.GetSession().then(function (data) {
        $scope.logged = (data !== null);
    });
});