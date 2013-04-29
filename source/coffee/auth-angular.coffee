app = angular.module('OpenCenterDashboardApp')

app.factory 'auth', ($rootScope, dashboardService) ->
  auth =
    user: ""
    header: {}
    loggingIn: false

    tryLogin: (user, pass) ->
      token = "#{user}:#{pass}"
      auth.user = user
      auth.header = Authorization: "Basic #{btoa token}"

      form = $('#loginForm')
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
        headers: auth.header
        success: ->
          auth.loggingIn = false # Done logging in
          resetForm()
          $rootScope.$broadcast 'login', auth.user
        error: ->
          resetForm()
          user.focus()
          $rootScope.$broadcast 'loginFailed', auth.user

    logout: ->
      auth.user = ""
      auth.header = {}
      dashboardService.clearIndexModel()
      $rootScope.$broadcast 'logout'

  auth
