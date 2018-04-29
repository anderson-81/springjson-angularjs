app.controller("LoginController", function ($scope, $window, $http, AppService) {

    $scope.Login = function () {
        $scope.errors = [];
        $scope.status = true;

        var datas = {
            username: $scope.username,
            password: $scope.password,
            token: $scope.token
        };

        $http({
            method: 'POST',
            url: '/login',
            params: datas
        }).then(function successCallback(response) {
            var result = response.data;
            if (result.errors !== undefined) {
                $scope.errors = result.errors;
                $scope.status = false;
            }
            if (result.alert !== undefined) {
                alert(result.alert);
            }
            if (result.page !== undefined) {
                $window.location.href = result.page;
            }
            $scope.status = false;
        }, function errorCallback(response) {
            $scope.status = false;
            $window.location.href = "/errors/505";
        });
    };

    $scope.Logout = function () {
        if (confirm("Do you want logout?")) {
            $http({
                method: 'GET',
                url: '/logout'
            }).then(function successCallback(response) {
                var result = response.data;
                alert(result.alert);
                $window.location.href = "/index";
            }, function errorCallback(response) {
                $window.location.href = "/errors/505";
            });
        }
    };

    $scope.Cancel = function () {
        $window.location.href = "/index";
    };

    $scope.Reset = function () {
        $scope.errors = [],
            AppService.Token().then(function (data) {
            $scope.token = data;
        }),
        $scope.username = "anderson",
        $scope.password = "121181",
        $scope.errors = false,
        $scope.status = false;
    };
});