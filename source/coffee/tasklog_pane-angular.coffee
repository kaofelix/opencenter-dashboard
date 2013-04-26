app = angular.module('OpenCenterDashboardApp')

app.controller 'TaskLogPaneCtrl', ($scope, paneNotification) ->
  $scope.showPane = -> paneNotification.display
