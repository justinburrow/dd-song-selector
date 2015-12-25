'use strict'

describe 'Filter: inArray', ->

  # load the filter's module
  beforeEach module 'ddSongSelectApp'

  # initialize a new instance of the filter before each test
  inArray = {}
  beforeEach inject ($filter) ->
    inArray = $filter 'inArray'

  it 'should return the input prefixed with "inArray filter:"', ->
    text = 'angularjs'
    expect(inArray text).toBe ('inArray filter: ' + text)
