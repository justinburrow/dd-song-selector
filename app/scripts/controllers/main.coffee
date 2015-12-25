'use strict'

angular.module 'ddSongSelectApp'
  .controller 'MainCtrl', ($http) ->
    
    vm = @
    vm.sortType = 'title'
    vm.searchQuery = 'default'
    
    $http.get('songs/songs.json').success (data) ->
      vm.songList = data
    return
