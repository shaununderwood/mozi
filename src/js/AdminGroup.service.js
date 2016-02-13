( ( )=>{
  'use strict';

  let m;

  function AdminGroupService( Group, $q){
    m = this;
    m.$q = $q;
    m.Group = Group;

    m.model = {
      groupList: m.$q.deferred
    };

    m.updateList( );
  }

  AdminGroupService.prototype.updateList = function getList( ){
    let deferred = m.$q.defer( );
    m
      .Group
      .find({})
      .$promise
      .then(
      function success( result){
        m.model.groupList = result;
        deferred.resolve( result);
      },
      function failure( ){ }
    );

    return deferred.promise;
  };

  AdminGroupService.prototype.newEmptyModel = function newEmptyModel(){
    return {
      groupId: 0,
      name: null,
      referrerName: null,
      referrerAddress: null,
      referrerContactNumber: null,
      referrerEmail: null
    };
  };


  angular
    .module( 'app')
    .service( 'AdminGroupService', AdminGroupService)
  ;

})( );