'use strict'

angular.module 'ddSongSelectApp'
  .filter 'inArray', ($filter) ->
    (list, arrayFilter, element) ->
      console.log arrayFilter
      if arrayFilter.length > 0
        return $filter('filter')(list, (listItem) ->
          arrayFilter.indexOf(listItem['song'][element]) != -1
        )
      else
        return list
      return
  
