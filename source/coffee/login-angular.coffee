app = angular.module('OpenCenterDashboardApp')

app.controller 'LoginCtrl', ($scope) ->
  $scope.username = ''
  $scope.password = ''

  $scope.login = ->
    angular.element($("#banner")).scope().makeBasicAuth $scope.username, $scope.password
