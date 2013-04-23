app = angular.module('OpenCenterDashboardApp', [])

app.controller 'NavBarCtrl', ($scope) ->
  $scope.authUser = dashboard.user

  $scope.authCheck = ->
    if dashboard.authUser() isnt "" then true else false
  $scope.authLogout = dashboard.authLogout

  $scope.siteNav = [
    name: "OpenCenter"
    template: "indexTemplate"
  ]
