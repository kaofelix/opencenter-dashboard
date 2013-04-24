app = angular.module('OpenCenterDashboardApp', [])

app.controller 'NavBarCtrl', ($scope, auth) ->
  $scope.authUser = auth.user
  $scope.authCheck = ->
    if auth.user() isnt "" then true else false
  $scope.authLogout = auth.logout

  $scope.siteNav = [
    name: "OpenCenter"
    template: "indexTemplate"
  ]

app.factory 'auth', ->
  user: dashboard.authUser
  logout: dashboard.authLogout
