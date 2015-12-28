'use strict'

angular.module 'ddSongSelectApp'
  .controller 'MainCtrl', ($http, $scope) ->
    
    vm = @
    window.MAIN = @
    vm.sortType = 'song.title'
    vm.searchQuery = 'default'
    vm.genreFilter = []
    vm.tempoFilter = []
    vm.selectedSongs = []
    vm.send = {}

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
      
      vm.allSongsTotal = vm.songList.songlist.songs.length


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
    
    #Close panels when clicked, preserve window scroll Y position (real hacky)
    vm.closer = ->
      $scope.reviewOpen = false
      $scope.optionOpen = false
      $scope.showThanks = false
      angular.element('body').removeClass('fixed')
      if window.innerWidth < 768
        window.scrollTo(0, $scope.topShim)
      return
      
    vm.topShim = ->
      $scope.topShim = window.pageYOffset
      angular.element('body').addClass('fixed').css('top', -$scope.topShim-25)
      return
    
    #Send off data to PHP mailer
    vm.submitter = ->
      data = 
        songs: vm.selectedSongs
        client: vm.send
      response = $http.post('scripts/mailer.php', data)
      response.success (data, status, headers, config) ->
        vm.success()
    
    vm.success = ->
      $scope.reviewOpen = false
      $scope.optionOpen = false
      $scope.showThanks = true
      vm.selectedSongs = []
      vm.send = {}
      vm.genreFilter = []
      vm.tempoFilter = []
      i = 0
      while i < vm.filteredSongs.length
        vm.filteredSongs[i].checked = false
        i++
      angular.element('body').addClass('fixed')
      angular.element('input').attr('checked', false)
      return
      
    return
