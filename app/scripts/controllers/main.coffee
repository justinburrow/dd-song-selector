'use strict'

angular.module 'ddSongSelectApp'
  .controller 'MainCtrl', ($http) ->
    
    vm = @
    vm.sortType = 'song.title'
    vm.searchQuery = 'default'
    vm.genreFilter = []
    vm.tempoFilter = []
    vm.selectedSongs = []
        
    #Get JSON data, setup arrays to build filters from key values
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


    #Grab the filtering type and push it to the appropriate array
    vm.clickFilter = (name, type) ->
      filterArray = eval('vm.'+type+'Filter')
      index = filterArray.indexOf(name)
      if index == -1
        filterArray.push(name)
      else filterArray.splice(index, 1)
    
    #Grab song properties from ng-repeat object, create new JSON object, push to selectedSongs if it doesn't exist, splice if it does
    vm.selectSong = (song) ->
      id = song.song.ID
      selectedIndex = vm.getSelectedSongIndex(id)
      if selectedIndex == -1
        selectedSong = {"id": id, "title": song.song.title, "artist": song.song.artist, "genre": song.song.genre, "tempo": song.song.tempo}
        vm.selectedSongs.push(selectedSong)
      else
        vm.selectedSongs.splice(selectedIndex, 1)

      
    #Determine if selected song is in selectedSongs array by ID key
    vm.getSelectedSongIndex = (val) ->
      i = 0
      while i < vm.selectedSongs.length
        if vm.selectedSongs[i].id == val
          return i
        i++
      -1
    
    return
