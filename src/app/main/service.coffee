angular.module "connectForms"
  .service "HomeService", ($http, $q) ->

    return {

      getInter : () ->
        $http
          url     : "https://spreadsheets.google.com/feeds/list/1px04pXsN18XEWEvfETmmBFk5si89hUygjFU7fkex_OA/1/public/values?alt=json"
          method  : 'GET'

      getCoqueteleiras : () ->
        $http
          url     : "https://spreadsheets.google.com/feeds/list/1hm_2Grou-Mzxcw1r1wJ22LgCxVfHqx--v5l6GGcbSE8/1/public/values?alt=json"
          method  : 'GET'
    }
