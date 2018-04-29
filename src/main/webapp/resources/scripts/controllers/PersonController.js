app.controller("PersonController", function ($scope, $window, $http, $location, AppService, Upload) {
    
    $scope.List = function () {
        $scope.status = true;
        $scope.persons = [];
        $http({
            method: 'PUT',
            url: '/person/list'
        }).then(function successCallback(response) {
            if (response.data.length > 0) {
                var persons = response.data;
                if (persons.length > 0) {
                    $scope.persons = response.data;
                } else {
                    alert("No records.");
                }
                $scope.status = false;
            }
        }, function errorCallback(response) {
            $location.path("/errors/505");
        });
    };

    $scope.New = function () {
        $window.location.href = "/person/new";
    };

    $scope.Create = function () {
        $scope.errors = [];
        $scope.status = true;
        var datas = {
            name: $scope.person.name,
            email: $scope.person.email,
            salary: $scope.person.salary,
            birthday: $scope.person.birthday,
            gender: $scope.person.gender,
            picture: $scope.picture,
            token: $scope.token
        };

        Upload.upload({
            url: '/person/new',
            data: datas,
            headers: {'Content-Type': 'application/json'},
            method: 'POST'
        }).then(function (resp) {
            var result = resp.data;
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
        }, function (resp) {
        }, function (evt) {
        });
    };

    $scope.Reset = function () {
        $scope.person = {},
        $scope.errors = [],
        AppService.Token().then(function (data) {
            $scope.token = data;
        }),
        $scope.person.name = '',
        $scope.person.email = '',
        $scope.genders = [{value: "M", name: "MALE"}, {value: "F", name: "FEMALE"}],        $scope.person.birthday = '01/01/2001',
        $scope.person.gender = "M",
        $scope.errors = false,
        $scope.status = false;
        document.getElementById("divCreate").style.display = "block";
    };

    $scope.Cancel = function () {
        $window.location.href = "/person/index";
    };

    $scope.GetPersonByID = function () {
        var link = "";
        AppService.Token().then(function (data) {
            $scope.token = data;
            link = $window.location.pathname + "/" + $scope.token;
            $http({
                method: 'GET',
                url: link
            }).then(function successCallback(response) {
                $scope.person = response.data.person;
                $scope.avatar = response.data.picture;
                $scope.person.birthday = response.data.birthday;
                $scope.frm = true;
                document.getElementById("divEdit").style.display = "block";
            }, function errorCallback(response) {
                alert("Not found.");
                $window.location.href = '/person/index';
            });
        });
    };

    $scope.Edit = function () {
        if (confirm("Do you want edit this Person?")) {
            $scope.errors = [];
            $scope.status = true;
            var datas = {
                id: $scope.person.id,
                name: $scope.person.name,
                email: $scope.person.email,
                salary: $scope.person.salary,
                birthday: $scope.person.birthday,
                gender: $scope.person.gender,
                picture: $scope.picture,
                token: $scope.token
            };

            Upload.upload({
                url: '/person/edit/update',
                data: datas,
                headers: {'Content-Type': 'application/json'},
                method: 'POST'
            }).then(function (resp) {
                var result = resp.data;
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
            }, function (resp) {
            }, function (evt) {
            });
        }
    };

    $scope.Delete = function () {
        if (confirm("Do you want delete this Person?")) {
            $scope.status = true;
            $http({
                method: 'GET',
                url: '/person/delete/' + $scope.person.id + "/" + $scope.token
            }).then(function successCallback(response) {
                var result = response.data;
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
        }
    };
});