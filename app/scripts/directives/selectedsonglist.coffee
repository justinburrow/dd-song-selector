'use strict'

angular.module 'ddSongSelectApp'
  .directive 'selectedSongList', ->
    restrict: 'EA'
    link: (scope, element, attrs) ->
      angular.element('html').click (event) ->
        console.log angular.element(event.target)
        if angular.element(event.target).hasClass('mb-review')
          angular.element('.selected-songs').toggleClass('expand')
          return
        else if angular.element('.selected-songs').hasClass('expand') && !angular.element(event.target).closest('.selected-songs').length
          event.preventDefault()
          angular.element('.selected-songs').toggleClass('expand')