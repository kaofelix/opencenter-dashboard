describe 'Controller: FooterCtrl', ->
  beforeEach module('OpenCenterDashboardApp')

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    @scope = $rootScope.$new()
    @pane_notification = {}
    @ctrl = $controller 'FooterCtrl',
      $scope: @scope
      paneNotification: @pane_notification

  it 'should have a paneNotification service', ->
    expect(@scope.paneNotification).toBe(@pane_notification)
