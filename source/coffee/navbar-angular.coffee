app = angular.module('OpenCenterDashboardApp')

app.controller 'NavBarCtrl', ($scope, auth) ->
  $scope.authUser = ""
  $scope.authHeader = {}

  $scope.authCheck =  ->
    if $scope.authUser isnt "" then true else false

  $scope.authLogout = ->
    $scope.authUser = ""
    $scope.authHeader = {}
    dashboard.clearIndexModel()

  $scope.makeBasicAuth = (user, pass) ->
    auth.makeBasicAuth user, pass
    $scope.authUser = auth.authUser
    $scope.authHeader = auth.authHeader

  $scope.siteNav = [
    name: "OpenCenter"
    template: "indexTemplate"
  ]

  $scope.loggingIn = false
