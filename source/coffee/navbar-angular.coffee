app = angular.module('OpenCenterDashboardApp')

app.controller 'NavBarCtrl', ($scope, auth) ->
  $scope.authUser = ""

  $scope.authCheck =  ->
    if $scope.authUser isnt "" then true else false

  $scope.logout = ->
    $scope.authUser = ""
    $scope.authHeader = {}
    dashboard.clearIndexModel()

  $scope.siteNav = [
    name: "OpenCenter"
    template: "indexTemplate"
  ]

  $scope.$on 'login', (ev, username) ->
    $scope.authUser = username
    $scope.$apply()
