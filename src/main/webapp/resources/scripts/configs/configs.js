app.config(['ADMdtpProvider', function (ADMdtp) {
    ADMdtp.setOptions({
        calType: 'gregorian',
        format: 'DD/MM/YYYY',
        default: '01/01/2001',
        autoClose: true
    });
}]);