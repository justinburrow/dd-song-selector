'use strict'

describe 'Directive: selectedSongs', ->

  # load the directive's module
  beforeEach module 'ddSongSelectApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<selected-songs></selected-songs>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the selectedSongs directive'
