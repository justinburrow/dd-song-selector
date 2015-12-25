'use strict'

angular.module 'ddSongSelectApp'
  .controller 'MainCtrl', ($http) ->
    
    vm = @
    vm.sortType = 'song.title'
    vm.searchQuery = 'default'
    vm.genreFilter = []
    vm.tempoFilter = []
    
    vm.clickFilter = (name, type) ->
      #name = name.toLowerCase()
      #type = type.toLowerCase()
      filterArray = eval('vm.'+type+'Filter')
      index = filterArray.indexOf(name)
      if index == -1
        filterArray.push(name)
      else filterArray.splice(index, 1)

    $http.get('songs/songs.json').success (data) ->
      vm.songList = data
  
      #Grab all unique genres from vm.songList, push to array
      i = 0
      vm.songGenres = []
      while i < vm.songList.songlist.songs.length
        genre = vm.songList.songlist.songs[i].song.genre
        if genre && vm.songGenres.indexOf(genre) == -1
          vm.songGenres.push(genre)
        i++
    
      #Grab all unique tempos from vm.songList, push to array
      i = 0
      vm.songTempos = []
      while i < vm.songList.songlist.songs.length
        tempo = vm.songList.songlist.songs[i].song.tempo
        if tempo && vm.songTempos.indexOf(tempo) == -1
          vm.songTempos.push(tempo)
        i++

    return

      
