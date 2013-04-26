app = angular.module('OpenCenterDashboardApp')

app.factory 'auth', ($rootScope, dashboardService) ->
  auth =
    user: ""
    header: {}
    loggingIn: false

    login: (user, pass) ->
      token = "#{user}:#{pass}"
      auth.user = user
      auth.header = Authorization: "Basic #{btoa token}"

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
        headers: auth.header
        success: ->
          auth.loggingIn = false # Done logging in
          dashboardService.hideModal "#indexLoginModal"
          resetForm()
          form.find('.alert').hide()
          $rootScope.$broadcast 'login', auth.user
        error: ->
          resetForm()
          form.find('.alert').show()
          user.focus()

    logout: ->
      auth.user = ""
      auth.header = {}
      dashboardService.clearIndexModel()

  auth
