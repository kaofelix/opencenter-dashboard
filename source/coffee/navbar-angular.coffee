app = angular.module('OpenCenterDashboardApp')

app.controller 'NavBarCtrl', ($scope) ->
  $scope.authUser = ""
  $scope.authHeader = {}

  $scope.authCheck =  ->
    if $scope.authUser isnt "" then true else false

  $scope.authLogout = ->
    $scope.authUser = ""
    $scope.authHeader = {}

    model = dashboard.indexModel
    model.keyItems = {}
    model.tmpItems []
    # Try grabbing new nodes; will trigger login form if needed
    dashboard.getNodes "/octr/nodes/", model.tmpItems, model.keyItems

  $scope.makeBasicAuth = (user, pass) ->
    token = "#{user}:#{pass}"
    $scope.authUser = user
    $scope.authHeader = Authorization: "Basic #{btoa token}"

    form = $(form)
    group = form.find('.control-group')
    user = group.first().find('input')
    pass = group.next().find('input')
    throb = form.find('.form-throb')
    resetForm = ->
      throb.hide()
      group.find('input').val ""
      group.removeClass ['error', 'success']
      group.find('.controls label').remove()
    throb.show()

    $.ajax # Test the auth
      url: "/octr/"
      headers: $scope.authHeader
      success: ->
        dashboard.loggingIn = false # Done logging in
        resetForm()
        form.find('.alert').hide()
        dashboard.hideModal "#indexLoginModal"
      error: ->
        resetForm()
        form.find('.alert').show()
        user.focus()


  $scope.siteNav = [
    name: "OpenCenter"
    template: "indexTemplate"
  ]

  $scope.loggingIn = false
