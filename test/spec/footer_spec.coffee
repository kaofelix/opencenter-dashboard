describe 'Controller: FooterCtrl', ->
  beforeEach module('OpenCenterDashboardApp')

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    @scope = $rootScope.$new()
    @pane_notification = { toggle: jasmine.createSpy('toggle') }
    @ctrl = $controller 'FooterCtrl',
      $scope: @scope
      paneNotification: @pane_notification

  it 'should have a toggle property', ->
    expect(@scope.togglePane).toBe(@pane_notification.toggle)
