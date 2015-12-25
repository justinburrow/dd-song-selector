'use strict'

describe 'Directive: headerOffset', ->

  # load the directive's module
  beforeEach module 'ddSongSelectApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<header-offset></header-offset>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the headerOffset directive'
