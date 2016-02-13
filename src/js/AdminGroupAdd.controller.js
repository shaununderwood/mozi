(( )=>{
  'use strict';
  let vm;

  function AdminGroupAddController( $state, $stateParams, Group, AdminGroupService){
    vm = this;

    vm.$state = $state;
    vm.$stateParams = $stateParams;
    vm.Group = Group;
    vm.AdminGroupService = AdminGroupService;

    vm.model = vm.new( );
  }

  AdminGroupAddController.prototype.new = function _new( ){
    return vm.AdminGroupService.newEmptyModel( );
  };

  AdminGroupAddController.prototype.add = function add( data){
    vm
      .Group
      .create( data)
      .$promise
      .then( success, vm.failure);

    function success( ){
      vm.model = vm.new( );
      vm.$state.go( '^');
    }
  };

  AdminGroupAddController.prototype.cancel = function cancel( ){
    vm.model = vm.new( );
    vm.$state.go('^');
  };

  AdminGroupAddController.prototype.failure = function failure( reason){
    alert( 'ERROR: ' + reason.data.error.message);
    console.log( 'ERROR: ', reason.data.error.message);
  };

  let app = angular.module( 'app');
  app.controller( 'AdminGroupAddController', AdminGroupAddController);

})( );