describe 'Controller: NavBarCtrl', ->
  beforeEach module('OpenCenterDashboardApp')

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    @scope = $rootScope.$new()
    spyOn(@scope, '$apply')

    @auth = { logout: jasmine.createSpy('logout') }

    @NavBarCtrl = $controller 'NavBarCtrl',
      $scope: @scope
      auth: @auth

  it 'should log in user on receiving the login event', ->
    @scope.$broadcast 'login', "someuser"

    expect(@scope.isLoggedIn()).toBe(true)
    expect(@scope.$apply).toHaveBeenCalled()

  it 'should logout the user', ->
    @scope.logout()

    expect(@scope.isLoggedIn()).toBe(false)
    expect(@auth.logout).toHaveBeenCalled()
