'use strict'

angular.module 'ddSongSelectApp'
  .directive 'selectedSongs', ->
    restrict: 'E'
    link: (scope, element, attrs) ->
      angular.element('html').click (event) ->
        if angular.element(event.target).hasClass('dt-review')
          angular.element('.selected-songs').toggleClass('expand')
          return
        else if angular.element('.selected-songs').hasClass('expand') && !angular.element(event.target).closest('.selected-songs').length
          angular.element('.selected-songs').toggleClass('expand')