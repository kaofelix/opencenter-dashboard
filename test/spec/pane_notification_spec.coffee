describe 'Factory: paneNotification', ->
  beforeEach module('OpenCenterDashboardApp')

  # Initialize paneNotification service
  beforeEach inject (paneNotification) ->
    @paneNotification = paneNotification

  it 'should contain a paneNotification service', ->
    expect(@paneNotification).not.toBe(null)
  
  it 'should contain a display property', ->
    expect(@paneNotification.display).toBe(false)
    
  it 'should be able to toggle pane display on and off', ->
    @paneNotification.display = true
    @paneNotification.toggle()
    expect(@paneNotification.display).toBe(false)
    @paneNotification.toggle()
    expect(@paneNotification.display).toBe(true)
