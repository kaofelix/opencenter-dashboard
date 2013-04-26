app = angular.module('OpenCenterDashboardApp')

app.controller 'LoginFormCtrl', ($scope, auth) ->
  $scope.username = ''
  $scope.password = ''

  $scope.isLoggedIn = false

  $scope.login = ->
    auth.login $scope.username, $scope.password
    $scope.isLoggedIn = true

  $scope.$on 'logout', ->
    $scope.isLoggedIn = false

  $scope.modalOptions =
    dialogClass: 'indexLoginModal modal'
    backdropFade: true
    dialogFade: true
    keyboard: false
    backdropClick: false
