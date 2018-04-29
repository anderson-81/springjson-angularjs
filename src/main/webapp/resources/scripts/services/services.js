app.service("AppService", function ($http, $location) {
    this.Token = function () {
        return $http({
            method: 'PUT',
            url: '/token',
            async: false
        }).then(function successCallback(response) {
            return response.data;
        }, function errorCallback(response) {
            $location.path("/errors/505");
        });
    },
    this.GetSession = function () {
        return $http({
            method: 'GET',
            url: '/getsession',
            async: false
        }).then(function successCallback(response) {
            return response.data;
        }, function errorCallback(response) {
            $location.path("/errors/505");
        });
    };
});