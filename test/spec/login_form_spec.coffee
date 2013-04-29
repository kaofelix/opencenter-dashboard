describe 'Controller: LoginFormCtrl', ->
  beforeEach module('OpenCenterDashboardApp')

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    @scope = $rootScope.$new()
    @auth = { tryLogin: jasmine.createSpy('login') }

    @NavBarCtrl = $controller 'LoginFormCtrl',
      $scope: @scope
      auth: @auth

  it 'should be logged out by default', ->
    expect(@scope.isLoggedIn).toBe false

  it 'should not have a failed login by default', ->
    expect(@scope.loginFailed).toBe false

  it 'should try logging in on the auth service', ->
    @scope.username = 'myuser'
    @scope.password = 'mypass'

    @scope.tryLogin()
    expect(@auth.tryLogin).toHaveBeenCalledWith 'myuser', 'mypass'

  it 'should assume login is successful to hide form when trying to login', ->
    @scope.tryLogin()
    expect(@scope.isLoggedIn).toBe true

  it 'should assume not failed when trying to login', ->
    @scope.loginFailed = true

    @scope.tryLogin()
    expect(@scope.loginFailed).toBe false

  it 'should logout when receiving the logout event', ->
    @scope.isLoggedIn = true

    @scope.$broadcast 'logout'
    expect(@scope.isLoggedIn).toBe false

  it 'should be logged out when receiving the loginFailed event', ->
    @scope.isLoggedIn = true
    @scope.$broadcast 'loginFailed'

    expect(@scope.isLoggedIn).toBe false

  it 'should have a failed login when receiving the loginFailed event', ->
    @scope.$broadcast 'loginFailed'
    expect(@scope.loginFailed).toBe true

  it 'should not have a failed login when loggint out', ->
    @scope.loginFailed = true
    @scope.$broadcast 'logout'
    expect(@scope.loginFailed).toBe false
