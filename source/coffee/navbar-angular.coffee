app = angular.module('OpenCenterDashboardApp')

app.controller 'NavBarCtrl', ($scope, auth) ->
  $scope.username = ""

  $scope.isLoggedIn =  ->
    if $scope.username isnt "" then true else false

  $scope.$on 'login', (ev, username) ->
    $scope.username = username
    $scope.$apply()

  $scope.logout = ->
    $scope.username = ""
    auth.logout()

  $scope.siteNav = [
    name: "OpenCenter"
    template: "indexTemplate"
  ]
