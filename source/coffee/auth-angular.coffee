app = angular.module('OpenCenterDashboardApp')

app.factory 'auth', ($rootScope) ->
  auth =
    authUser: ""
    authHeader: {}

    makeBasicAuth: (user, pass) ->
      token = "#{user}:#{pass}"
      auth.authUser = user
      auth.authHeader = Authorization: "Basic #{btoa token}"

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
        headers: auth.authHeader
        success: ->
          dashboard.loggingIn = false # Done logging in
          resetForm()
          form.find('.alert').hide()
          dashboard.hideModal "#indexLoginModal"
          $rootScope.$broadcast 'login', auth.authUser
        error: ->
          resetForm()
          form.find('.alert').show()
          user.focus()
  auth
