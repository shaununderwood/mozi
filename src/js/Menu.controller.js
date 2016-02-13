(( )=>{
  'use strict';

  let vm;

  function MenuController( CurrentUser){
    vm = this;

    vm.CurrentUser = CurrentUser;
  }

  MenuController.prototype.getNameAsText = function getNameAsText( ){
    return vm.CurrentUser.userInfo.preferred_username.toUpperCase();
  };

  MenuController.prototype.getRoleAsText = function getRoleAsText( ){
    if ( vm.CurrentUser.keyCloak.realmAccess.roles.includes('admin')) return 'Admin';

    if ( vm.CurrentUser.keyCloak.realmAccess.roles.includes('manager')) return 'Manager';

    if ( vm.CurrentUser.keyCloak.realmAccess.roles.includes('associate')) return 'Associate';
  };

  MenuController.prototype.getNameAsText = function getNameAsText( ){
    return vm.CurrentUser.userInfo.preferred_username.toUpperCase();
  };

  MenuController.prototype.isAdmin = function isAdmin( ){
    return vm.CurrentUser.keyCloak.realmAccess.roles.includes( 'admin');
  };

  MenuController.prototype.isManager = function isManager( ){
    if ( this.isAdmin()) return false;
    return vm.CurrentUser.keyCloak.realmAccess.roles.includes( 'manager');
  };

  MenuController.prototype.isAssociate = function isAssociate( ){
    if ( this.isAdmin() || this.isManager()) return false;
    return vm.CurrentUser.keyCloak.realmAccess.roles.includes( 'associate');
  };




  let app = angular.module( 'app');
  app.controller( 'MenuController', MenuController);

})( );