describe 'Controller: NavBarCtrl', ->
  beforeEach module('OpenCenterDashboardApp')

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    @scope = $rootScope.$new()
    @auth = {}

    @NavBarCtrl = $controller 'NavBarCtrl',
      $scope: @scope
      auth: @auth

  it 'should check that the user is logged in', ->
    @scope.username = "Some user"
    expect(@scope.isLoggedIn()).toBe(true)

  it 'should check that the user is logged out', ->
    @scope.username = ""
    expect(@scope.isLoggedIn()).toBe(false)
