app = angular.module('OpenCenterDashboardApp')

app.controller 'LoginCtrl', ($scope, auth) ->
  $scope.username = ''
  $scope.password = ''

  $scope.login = ->
    auth.makeBasicAuth $scope.username, $scope.password
