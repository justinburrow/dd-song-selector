'use strict'

angular.module 'ddSongSelectApp'
  .directive 'selectedSongList', ($document) ->
    restrict: 'EA'
    link: (scope, element, attrs) ->