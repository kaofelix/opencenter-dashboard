app = angular.module('OpenCenterDashboardApp')

app.factory('paneNotification', ->
  scope = {}
  scope.display = false
  scope.toggle = -> scope.display = !scope.display
  scope
)
