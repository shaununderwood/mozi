(( )=>{
  'use strict';
  let vm;

  function AdminGroupEditController( $state, $stateParams, Group, GroupData, AdminGroupService){
    vm = this;

    vm.$state = $state;
    vm.$stateParams = $stateParams;
    vm.Group = Group;
    vm.GroupData = GroupData;
    vm.AdminGroupService = AdminGroupService;

    GroupData
      .$promise
      .then(( data)=>{ vm.updateViewModel( data);});

    vm.model = vm.new( );
  }

  AdminGroupEditController.prototype.new = function _new( ){
    return vm.AdminGroupService.newEmptyModel( );
  };

  AdminGroupEditController.prototype.save = function save( data){

    data
      .$save( )
      .then( success, vm.failure);

    function success( ){
      vm.model = vm.new( );
      vm.$state.go( '^');
    }
  };

  AdminGroupEditController.prototype.cancel = function cancel( ){
    vm.model = vm.new( );
    vm.$state.go('^');
  };

  AdminGroupEditController.prototype.failure = function failure( reason){
    alert( 'ERROR: ' + reason.data.error.message);
    console.log( 'ERROR: ', reason.data.error.message);
  };

  AdminGroupEditController.prototype.updateViewModel = function updateViewModel( newModel){
    vm.model = newModel;
  };


  let app = angular.module( 'app');
  app.controller( 'AdminGroupEditController', AdminGroupEditController);

})( );