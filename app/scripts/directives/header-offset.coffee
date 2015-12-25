'use strict'

###*
 # @ngdoc directive
 # @name ddSongSelectApp.directive:headerOffset
 # @description
 # # headerOffset
###
angular.module 'ddSongSelectApp'
  .directive 'headerOffset', ->
    restrict: 'A'
    link: (scope, element, attrs) ->

      headerHeight = angular.element('.header').outerHeight() + 20;
      element.css('padding-top', headerHeight)