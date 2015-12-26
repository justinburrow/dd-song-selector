'use strict'

angular.module 'ddSongSelectApp'
  .directive 'selectedSongList', ->
    restrict: 'EA'
    link: (scope, element, attrs) ->
      angular.element('html').click (event) ->
        console.log angular.element(event.target)
        if angular.element(event.target).hasClass('mb-review') || angular.element(event.target).hasClass('dt-review')
          angular.element('.selected-songs').toggleClass('expand')
          return
        if angular.element(event.target).hasClass('mb-options')
          angular.element('.filter-col').toggleClass('expand')
          return
        else if angular.element('.selected-songs').hasClass('expand') || angular.element('.filter-col').hasClass('expand')  && !angular.element(event.target).closest('.selected-songs').length && !angular.element(event.target).closest('.filter-col').length
          event.preventDefault()
          angular.element('.selected-songs').removeClass('expand')
          angular.element('.filter-col').removeClass('expand')