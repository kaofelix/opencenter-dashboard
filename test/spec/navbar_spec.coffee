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
    @auth.user = -> "Some user"
    expect(@scope.authCheck()).toBe(true)

  it 'should check that the user is logged out', ->
    @auth.user = -> ""
    expect(@scope.authCheck()).toBe(false)
