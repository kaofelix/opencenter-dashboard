app = angular.module('OpenCenterDashboardApp')

app.controller 'FooterCtrl', ($scope, paneNotification) ->
  $scope.paneNotification = paneNotification
