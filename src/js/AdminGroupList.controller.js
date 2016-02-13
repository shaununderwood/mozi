(( )=>{
  'use strict';

  let vm;

  function AdminGroupListController( $state, groupListData){
    vm = this;
    vm.$state = $state;

    vm.model = {
      groupList: [ ]
    };

    vm.updateViewModel( groupListData);
  }

  AdminGroupListController.prototype.updateViewModel = function ( newModel){
    vm.model.groupList = newModel;
  };

  AdminGroupListController.prototype.add = function add( ){
    vm.$state.go( 'loggedin.administration.groups.add');
  };

  AdminGroupListController.prototype.edit = function edit( model){
    vm.$state.go( 'loggedin.administration.groups.edit', { groupId: model.groupId});
  };

  let app = angular.module( 'app');
  app.controller( 'AdminGroupListController', AdminGroupListController);

})( );