app = angular.module('OpenCenterDashboardApp')

app.controller 'LoginFormCtrl', ($scope, auth) ->
  $scope.username = ''
  $scope.password = ''

  $scope.login = ->
    auth.login $scope.username, $scope.password
