'use strict'

angular.module 'ddSongSelectApp'
  .filter 'inArray', ($filter) ->
    (list, arrayFilter, element) ->
      if arrayFilter.length > 0
        return $filter('filter')(list, (listItem) ->
          arrayFilter.indexOf(listItem['song'][element]) != -1
        )
      else
        return list
      return
  
