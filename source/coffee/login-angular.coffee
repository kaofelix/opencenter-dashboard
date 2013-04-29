app = angular.module('OpenCenterDashboardApp')

app.controller 'LoginFormCtrl', ($scope, auth) ->
  $scope.username = ''
  $scope.password = ''

  $scope.isLoggedIn = false
  $scope.loginFailed = false

  $scope.tryLogin = ->
    auth.tryLogin $scope.username, $scope.password
    $scope.loginFailed = false
    $scope.isLoggedIn = true

  $scope.$on 'logout', ->
    $scope.isLoggedIn = false
    $scope.loginFailed = false

  $scope.$on 'loginFailed', ->
    $scope.isLoggedIn = false
    $scope.loginFailed = true

  $scope.modalOptions =
    dialogClass: 'indexLoginModal modal'
    backdropFade: true
    dialogFade: true
    keyboard: false
    backdropClick: false
