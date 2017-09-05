angular.module 'connectForms'
 .controller 'MainController', ($timeout, $scope, $interval, HomeService) ->
    'ngInject'
    
    # Definitions
    $scope.pacoteOnibus = []
    $scope.sectionSelected = 'todos'

    # Methods
    $scope.methods =
      export : (aba) ->
        blob = new Blob([document.getElementById("exportable-#{aba}").innerHTML], {
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
        })
        saveAs(blob, "#{aba}.xls")

      get: ->
        HomeService.get()
        .then (result) ->
          console.log result.data.feed.entry
          $scope.entries = result.data.feed.entry

          # Pacote onibus
          $scope.pacoteOnibus = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$pacotebusão.$t is 'Sim'
          $scope.pacoteOnibus = _.map $scope.pacoteOnibus, (entry) ->
           return {
             nome: entry.gsx$nomedocomprador.$t
             rg: entry.gsx$rgdocomprador.$t
           }

          # Pacote festa
          $scope.pacoteFesta = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$pacotefesta.$t is 'Sim'
          $scope.pacoteFesta = _.map $scope.pacoteFesta, (entry) ->
           return {
             nome: entry.gsx$nomedocomprador.$t
             rg: entry.gsx$rgdocomprador.$t
           }

          # Pacote aloja
          $scope.pacoteAloja = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$pacotealoja.$t is 'Sim'
          $scope.pacoteAloja = _.map $scope.pacoteAloja, (entry) ->
           return {
             nome: entry.gsx$nomedocomprador.$t
             rg: entry.gsx$rgdocomprador.$t
           }

          # Batas PP
          $scope.batasPP = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$bata.$t is 'PP'
          $scope.batasPP = _.map $scope.batasPP, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # Batas P
          $scope.batasP = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$bata.$t is 'P'
          $scope.batasP = _.map $scope.batasP, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # Batas M
          $scope.batasM = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$bata.$t is 'M'
          $scope.batasM = _.map $scope.batasM, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # Batas G
          $scope.batasG = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$bata.$t is 'G'
          $scope.batasG = _.map $scope.batasG, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # Batas GG
          $scope.batasGG = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$bata.$t is 'GG'
          $scope.batasGG = _.map $scope.batasGG, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # samba PP
          $scope.sambaPP = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$samba.$t is 'PP'
          $scope.sambaPP = _.map $scope.sambaPP, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # samba P
          $scope.sambaP = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$samba.$t is 'P'
          $scope.sambaP = _.map $scope.sambaP, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # samba M
          $scope.sambaM = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$samba.$t is 'M'
          $scope.sambaM = _.map $scope.sambaM, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # samba G
          $scope.sambaG = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$samba.$t is 'G'
          $scope.sambaG = _.map $scope.sambaG, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # samba P
          $scope.sambaGG = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$samba.$t is 'GG'
          $scope.sambaGG = _.map $scope.sambaGG, (entry) ->
           return entry.gsx$nomedocomprador.$t

          # Lote Promocional
          $scope.lotePromocional = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$lote.$t is 'Promocional'
          $scope.lotePromocional = _.map $scope.lotePromocional, (entry) ->
           return {
             nome: entry.gsx$nomedocomprador.$t
             rg: entry.gsx$rgdocomprador.$t
           }

          # Lote 1
          $scope.lote1 = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$lote.$t is 'Lote 1'
          $scope.lote1 = _.map $scope.lote1, (entry) ->
           return {
             nome: entry.gsx$nomedocomprador.$t
             rg: entry.gsx$rgdocomprador.$t
           }

          # Lote 2
          $scope.lote2 = _.filter  $scope.entries, (entry) ->           
            return entry.gsx$lote.$t is 'Lote 2'
          $scope.lote2 = _.map $scope.lote2, (entry) ->
           return {
             nome: entry.gsx$nomedocomprador.$t
             rg: entry.gsx$rgdocomprador.$t
           }

          # Basquete masculino
          $scope.basqueteMasculino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isBasquete = esportes.search 'basquete'
            return entry.gsx$gênero.$t is 'masculino' and (isBasquete isnt -1)
  
          $scope.basqueteMasculino = _.map $scope.basqueteMasculino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Futebol masculino
          $scope.futebolMasculino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isfutebol = esportes.search 'Futebol'
            return entry.gsx$gênero.$t is 'masculino' and (isfutebol isnt -1)
  
          $scope.futebolMasculino = _.map $scope.futebolMasculino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Volei masculino
          $scope.voleiMasculino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isvolei = esportes.search 'volei'
            return entry.gsx$gênero.$t is 'masculino' and (isvolei isnt -1)
  
          $scope.voleiMasculino = _.map $scope.voleiMasculino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Handball masculino
          $scope.handballMasculino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            ishandball = esportes.search 'handball'
            return entry.gsx$gênero.$t is 'masculino' and (ishandball isnt -1)
  
          $scope.handballMasculino = _.map $scope.handballMasculino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Individuais masculino
          $scope.individuaisMasculino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isindividuais = esportes.search 'INDIVIDUAIS'
            return entry.gsx$gênero.$t is 'masculino' and (isindividuais isnt -1)
  
          $scope.individuaisMasculino = _.map $scope.individuaisMasculino, (entry) ->
            return entry.gsx$nomedocomprador .$t


          # Basquete Feminino
          $scope.basqueteFeminino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isBasquete = esportes.search 'basquete'
            return entry.gsx$gênero.$t is 'feminino' and (isBasquete isnt -1)
  
          $scope.basqueteFeminino = _.map $scope.basqueteFeminino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Futebol Feminino
          $scope.futebolFeminino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isfutebol = esportes.search 'Futebol'
            return entry.gsx$gênero.$t is 'feminino' and (isfutebol isnt -1)
  
          $scope.futebolFeminino = _.map $scope.futebolFeminino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Voltei Feminino
          $scope.voleiFeminino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isvolei = esportes.search 'volei'
            return entry.gsx$gênero.$t is 'feminino' and (isvolei isnt -1)
  
          $scope.voleiFeminino = _.map $scope.voleiFeminino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Handball feminino
          $scope.handballFeminino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            ishandball = esportes.search 'handball'
            return entry.gsx$gênero.$t is 'feminino' and (ishandball isnt -1)
  
          $scope.handballFeminino = _.map $scope.handballFeminino, (entry) ->
            return entry.gsx$nomedocomprador .$t

          # Individuais Feminino
          $scope.individuaisFeminino = _.filter $scope.entries, (entry) ->
            esportes = entry.gsx$atleta.$t
            isindividuais = esportes.search 'INDIVIDUAIS'
            return entry.gsx$gênero.$t is 'feminino' and (isindividuais isnt -1)
  
          $scope.individuaisFeminino = _.map $scope.individuaisFeminino, (entry) ->
            return entry.gsx$nomedocomprador .$t

    $scope.methods.get()
    $interval () ->
      $scope.methods.get()
    , 10000
    return
