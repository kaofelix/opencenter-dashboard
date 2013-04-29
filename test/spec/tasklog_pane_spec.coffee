describe 'Controller: TaskLogPaneCtrl', ->
  beforeEach module('OpenCenterDashboardApp')
  
  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    @scope = $rootScope.$new
    @pane_notification = { api: 'methods' }
    @ctrl = $controller 'TaskLogPaneCtrl',
      $scope: @scope
      paneNotification: @pane_notification
  
  it 'should be able to access paneNotification service', ->
    expect(@scope.paneNotification).toEqual({ api: 'methods' })
